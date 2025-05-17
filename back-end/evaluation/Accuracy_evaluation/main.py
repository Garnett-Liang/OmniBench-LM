import os
import re
import json
import torch
import requests
from tqdm import tqdm
import pandas as pd
from pathlib import Path
from bert_score import score  
from pyswip import Prolog, Atom
from datasets import load_dataset
from datasets import Dataset
from difflib import SequenceMatcher
from sklearn.metrics import accuracy_score
from sentence_transformers import SentenceTransformer, util
from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline
os.environ['SWI_HOME_DIR'] = 'C:\\ZTCMyfile\\CODE\\swipl'  # 根据实际安装路径调整
from concurrent.futures import ThreadPoolExecutor  # 添加并行处理库

from get_wiki_cat_id import get_category_pages
from get_wiki_cat_id import save_links_to_file
from get_wiki_cat_id import get_category_members
from get_wiki_cat_id import extract_entity_pages
from get_wiki_cat_id import save_entity_links_to_file
from transitive_entity_extract import get_entity_info
from transitive_entity_extract import get_predicate_labels
from transitive_entity_extract import replace_predicates_with_labels
from transitive_pl_build import replace_special_characters
from transitive_pl_build import save_to_pl_file
from transitive_pl_build import process_prolog_file
from wiki_pl_build import get_related_entity_list
from wiki_pl_build import get_prop_list
from wiki_pl_build import replace_special_characters1
from wiki_pl_build import save_to_pl_file1
from wiki_pl_build import process_prolog_file1
from rule_generation import RuleGenerator
from prolog_inference import normalize_path
from prolog_inference import safe_consult
from prolog_inference import get_wikipedia_summary
from prolog_inference import replace_special_characters2
from prolog_inference import is_q_followed_by_digits
from prolog_inference import negation_prolog_inference
from prolog_inference import composite_prolog_inference
from prolog_inference import inverse_prolog_inference
from question_generation import inverse_template
from question_generation import negation_template
from question_generation import composite_template
from evaluate import generate_answers
from evaluate import calculate_similarity
from evaluate import get_average_similarity
from evaluate import evaluate_model
from evaluate import loadset


dataset_format = {
    "qid": "",
    "category": "",
    "reasoning": "",
    "entityid": "",
    "entity": "",
    "description": "",
    "question": "",
    "answer": "",
    "evidence": []
}

def get_wikidata_id_from_wikipedia_url(wikipedia_url):
    """Obtain the Wikidata entity ID from a Wikipedia URL"""
    title = wikipedia_url.split("/")[-1]
    url = f"https://en.wikipedia.org/w/api.php"
    params = {
        "action": "query",
        "titles": title,
        "prop": "pageprops",
        "format": "json"
    }
    
    try:
        response = requests.get(url, params=params, timeout=10)
        response.raise_for_status()
        data = response.json()
        pages = data.get("query", {}).get("pages", {})
        
        for page_id, page_info in pages.items():
            if "pageprops" in page_info and "wikibase_item" in page_info["pageprops"]:
                return {
                    "entity": f"http://www.wikidata.org/entity/{page_info['pageprops']['wikibase_item']}",
                    "entityLabel": title.replace("_", " ")
                }
    except requests.exceptions.SSLError:
        print(f"SSL 错误，跳过 {wikipedia_url}")
    except requests.exceptions.RequestException as e:
        print(f"请求 {wikipedia_url} 失败: {e}")
    
    return None  # 发生异常时，返回 None





if __name__ == "__main__":
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    
    # 选择推理规则
    print("请选择推理规则 1.逆向 2.否定 3.混合")
    rule_choice = input("请输入选项 (1-3): ")
    rule_map = {"1": "inverse", "2": "negation", "3": "composite"}
    reasoning_type = rule_map.get(rule_choice, "inverse")
    print(f"已选择推理规则: {reasoning_type}")
    
    # 选择领域
    print("请选择领域:")
    domains = ["geography", "history", "health", "mathematics", "nature", "people", "society", "technology", "culture"]
    for i, domain in enumerate(domains, 1):
        print(f"{i}. {domain}")
    domain_choice = input("请输入选项 (1-9): ")
    domain = domains[int(domain_choice) - 1] if domain_choice.isdigit() and 1 <= int(domain_choice) <= 9 else "geography"
    print(f"已选择领域: {domain}")
    print(f"Processing domain: {domain}")
    # Get all the category links
    category_name = f"{domain}"  
    category_file = f"category/{domain.lower()}_links.txt"
    save_links_to_file(category_name, category_file)

    # Get the entity pages from the selected categories
    selected_categories = []
    with open(category_file, 'r') as file:
        for line in file:
            selected_categories.append(line.split('/Category:')[-1].strip())
    selected_file = f"category/selected/{domain.lower()}_wiki_links.txt"
    max_pages_limit = 20
    wikipedia_urls = save_entity_links_to_file(selected_categories, selected_file, max_pages=max_pages_limit)
            
    # Get Wikidata IDs for the entity pages
    wikidata_entities = []
    for url in tqdm(wikipedia_urls, desc=f"Getting Wikidata IDs for {domain}"):
        result = get_wikidata_id_from_wikipedia_url(url)
        if result:
            wikidata_entities.append(result)
    output_file = f'wiki/{domain}_useful_entities.json'
    if not os.path.exists(os.path.dirname(output_file)):
        os.makedirs(os.path.dirname(output_file))
    with open(output_file, 'w') as f:
        json.dump(wikidata_entities, f, indent=4)
    
    #transitive_entity_extract.py
    print(f"transitive_entity_extract.py Processing topic: {domain}")
    try:
            with open(f'wiki/{domain}_useful_entities.json', 'r', encoding='utf-8') as f:
                data = json.load(f)
                                                     
            class_list = []
            for item in data:
                class_list.append((item['entity'].split('/')[-1], item['entityLabel']))
                
            useful_list = []
            for entity_id, entity_name in tqdm(class_list, desc=f"Processing entities for {domain}"):
                useful_entities = get_entity_info(entity_id, entity_name)
                if len(useful_entities) == 0:
                    continue
                useful_list.extend(useful_entities)
                
            # 现在从 useful_list 中收集谓词集合，而不是从原始数据中收集
            predicate_set = {entity["predicate"] for entity in useful_list}
            predicate_label_map = get_predicate_labels(predicate_set)
            updated_entities_list = replace_predicates_with_labels(useful_list, predicate_label_map)
            
            with open(f'wiki/transitive/{domain}_useful_entities.json', 'w', encoding='utf-8') as f:
                json.dump(updated_entities_list, f, indent=4)
    except FileNotFoundError:
            print(f"Error: Could not find entity file for topic '{domain}' at path: wiki/{domain}_useful_entities.json")
            print("Please make sure you have run the entity extraction step first.")
    except Exception as e:
            print(f"Error processing topic '{domain}': {str(e)}")
    

    #transitive_pl_build.py
    print(f"transitive_pl_build.py Processing topic: {domain}")
        
    output_folder = 'wiki/transitive/pl_files'
    backup_list = {}
    log_entities = []
    wiki_entity_path = f'wiki/transitive/{domain}_useful_entities.json'
    with open(wiki_entity_path, 'r') as file:
        entities = json.load(file)
    for entity in tqdm(entities):
        output_file = os.path.join(output_folder, f'{domain}.pl')
        save_to_pl_file(entity, output_file, backup_list)
        if entity not in log_entities:
            log_entities.append(entity)
    process_prolog_file(output_file, output_file)
    with open(f'wiki/transitive/backup/{domain}_backup_list.json', 'w') as file:
        json.dump(backup_list, file, indent=4)
    with open(f'wiki/transitive/log/{domain}_log.json', 'w') as file:
        json.dump(log_entities, file, indent=4)

    #wiki_pl_build.py
    print(f"wiki_pl_build.py Processing topic: {domain}")
    backup_list = {}
    log_entities = []
    output_folder = 'wiki/pl_files'
    prop_list = get_prop_list('utils/wiki_property_cat_v1.xlsx')
    wiki_entity_path = f'wiki/{domain}_useful_entities.json'
    with open(wiki_entity_path, 'r', encoding='utf-8') as file:
                entities = json.load(file)
    for entity in tqdm(entities):
                entity_id = entity['entity'].split('/')[-1]
                entity_name = entity['entityLabel']
                related_entities = get_related_entity_list(entity_id, entity_name, prop_list)
                output_file = os.path.join(output_folder, f'{domain}.pl')
                save_to_pl_file1(related_entities, output_file, backup_list)
                for related_entity in related_entities:
                    if related_entity not in log_entities:
                        log_entities.append(related_entity)
    process_prolog_file1(output_file, output_file)
    with open(f'wiki/backup/{domain}_backup_list.json', 'w', encoding='utf-8') as file:
                json.dump(backup_list, file, indent=4)
    with open(f'wiki/log/{domain}_log.json', 'w', encoding='utf-8') as file:
                json.dump(log_entities, file, indent=4)

    #rule_generation.py
    print(f"rule_generation.py Processing topic: {domain}")
    properties_file = 'utils/wiki_property_cat_v1.xlsx'
    output_folder = 'prolog_rules'
    rule_generator = RuleGenerator(properties_file, output_folder)
    rule_generator.generate_rules()
    rule_generator.write_rules_to_files()


    #prolog_inference.py
    print(f"prolog_inference.py Processing topic: {domain}")
    current_dir = os.path.dirname(os.path.abspath(__file__))
    new_fact_list = []

    prolog_fact_file = os.path.join(current_dir, 'wiki', 'pl_files', f'{domain}.pl')
    backup_file = os.path.join(current_dir, 'wiki', 'backup', f'{domain}_backup_list.json')
    log_entities_file = os.path.join(current_dir, 'wiki', 'log', f'{domain}_log.json')

    prolog_query_file = os.path.join(current_dir, 'prolog_rules', f'{reasoning_type}_rules.pl')
    problem_file = os.path.join(current_dir, 'prolog_rules', f'{reasoning_type}_problem_dict.json')

    output_dir = os.path.join(current_dir, 'data', 'derived', reasoning_type)
    os.makedirs(output_dir, exist_ok=True)

    new_fact_list = []

    if reasoning_type == 'inverse':
                new_fact_list = inverse_prolog_inference(prolog_fact_file, prolog_query_file, problem_file, backup_file, log_entities_file, domain, new_fact_list)
    elif reasoning_type == 'composite':
                new_fact_list = composite_prolog_inference(prolog_fact_file, prolog_query_file, problem_file, backup_file, log_entities_file, domain, new_fact_list)
    elif reasoning_type == 'negation':
                new_fact_list = negation_prolog_inference(prolog_fact_file, prolog_query_file, problem_file, backup_file, log_entities_file, domain, new_fact_list)
    

    output_file = os.path.join(output_dir, f'{domain}_new_facts.json')
    with open(output_file, 'w') as f:
                json.dump(new_fact_list, f, indent=4)


    #question_generation.py
    print(f"question_generation.py Processing topic: {domain}")
    rule = reasoning_type
    new_facts_file = f'data/derived/{rule}/{domain}_new_facts.json'
    with open(new_facts_file, 'r') as f:
                new_facts = json.load(f)

    generated_qa_list = []

    if rule == 'inverse':
                inverse_template(new_facts, generated_qa_list, f'prolog_rules/{rule}_problem_dict.json')
    elif rule == 'negation':
                negation_template(new_facts, generated_qa_list, f'prolog_rules/{rule}_problem_dict.json')
    elif rule == 'composite':
                composite_template(new_facts, generated_qa_list, f'prolog_rules/{rule}_problem_dict.json', f'wiki/backup/{domain}_backup_list.json')
    
    # 保存生成的QA列表到文件
    output_dir = f'data/generated/{rule}/'
    if not os.path.exists(output_dir):
                os.makedirs(output_dir)

    output_file = f'{output_dir}/{domain}_qa.json'
    with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(generated_qa_list, f, indent=4, ensure_ascii=False)
    print(f"Generated QA file saved at: {output_file}")
    #evaluatue.py
    questions, standard_answers = loadset(rule,domain)
    print("questions:", json.dumps(questions, indent=4, ensure_ascii=False))
    print("standard_answers:", json.dumps(standard_answers, indent=4, ensure_ascii=False))


    # 选择模型
    model_map = {
        "1": "Qwen/Qwen-1_8B",
        "2": "gpt2-medium",
        "3": "EleutherAI/gpt-neo-125M"
    }

    while True:
        print("\n请选择要测评的模型：")
        print("1. Qwen (Qwen-1_8B)")
        print("2. GPT-2 (gpt2-medium)")
        print("3. EleutherAI GPT-Neo (gpt-neo-125M)")
        print("4. 退出")
    
        model_choice = input("请输入选项 (1-4): ")
    
        if model_choice == "4":
            print("已退出模型选择。")
            break
    
        model_name = model_map.get(model_choice)
    
        if model_name:
            print(f"已选择模型: {model_name}")
        # 评估模型
            json_result = evaluate_model(model_name, questions, standard_answers)
            print("Evaluation result:", json_result)
        else:
            print("无效选项，请输入 1-4 之间的数字。")

