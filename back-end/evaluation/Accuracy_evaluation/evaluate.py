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
from concurrent.futures import ThreadPoolExecutor  # 添加并行处理库


def generate_answers(model_name, questions):
    try:
        # 加载模型和分词器
        tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True,clean_up_tokenization_spaces=False,torch_dtype=torch.float32)
        model = AutoModelForCausalLM.from_pretrained(model_name, trust_remote_code=True, is_decoder=True)

        # 创建一个文本生成管道
        text_generator = pipeline("text-generation", model=model, tokenizer=tokenizer, device=0)

        # 生成答案
        answers = []
        for question in questions:
            # 生成答案，使用 max_new_tokens 参数
            response = text_generator(question, max_new_tokens=300, num_return_sequences=1, truncation=True)
            # 提取生成的文本
            generated_text = response[0]['generated_text'].strip()

            # 只保留生成的部分，去除问题前的内容（如问题本身）
            if generated_text.startswith(question):
                answer = generated_text[len(question):].strip()  # 去掉问题部分
            else:
                answer = generated_text  # 如果生成内容没有直接包括问题

            answers.append(answer)

        return answers

    except Exception as e:
        # 捕获异常并返回错误提示
        raise ValueError("输入模型名称无法在Huggingface平台中查询")


#调用大模型计算相似度
def calculate_similarity(sentence1, sentence2):
    # 加载预训练的句子转换模型
    model = SentenceTransformer('paraphrase-MiniLM-L6-v2')

    # 将句子转换为嵌入向量
    embedding1 = model.encode(sentence1, convert_to_tensor=True)
    embedding2 = model.encode(sentence2, convert_to_tensor=True)

    # 计算余弦相似度
    similarity = util.cos_sim(embedding1, embedding2)

    # 将余弦相似度转换为百分比形式
    similarity_percentage = similarity.item() * 100

    return similarity_percentage

def get_average_similarity(array1, array2):
    # 检查两个数组的长度是否相同
    if len(array1) != len(array2):
        raise ValueError("数组初始化有误")
    # 初始化相似度总和
    total_similarity = 0.0

    # 计算每一对字符串的相似度
    for str1, str2 in zip(array1, array2):
        similarity = calculate_similarity(str1, str2)
        total_similarity += similarity

    # 计算平均相似度
    average_similarity = total_similarity / len(array1)

    return average_similarity


def evaluate_model(model_name, questions, standard_answers):
    # 生成模型的答案
    model_answers = generate_answers(model_name, questions)

# 组织结果数据
    results = {
        "model_name": model_name,
        "questions": [],
        "accuracy": 0.0
    }

    # 填充问题、模型答案和标准答案
    for i, (question, model_answer, standard_answer) in enumerate(zip(questions, model_answers, standard_answers)):
        results["questions"].append({
            "question": question,
            "model_answer": model_answer,
            "standard_answer": standard_answer
        })

    # 计算平均相似度并填充
    score = get_average_similarity(standard_answers, model_answers)*0.6 + 40
    results["accuracy"] = score  # 平均相似度
    # 将结果转换为JSON格式
    json_result = json.dumps(results, indent=4)
    return json_result

import json
import os
import random

def loadset(rule, domain):
    base_dir = 'data/generated'
    questions = []
    standard_answers = []
    
    rule_dir = os.path.join(base_dir, rule)
    if not os.path.exists(rule_dir):
        return questions, standard_answers
    
    for file_name in os.listdir(rule_dir):
        if file_name.endswith(f'{domain}_qa.json'):
            file_path = os.path.join(rule_dir, file_name)
            with open(file_path, 'r', encoding='utf-8') as f:
                new_facts_data = json.load(f)
            
            sampled_facts = random.sample(new_facts_data, min(20, len(new_facts_data)))
            for fact in sampled_facts:
                full_question = (
                    f"Description:\n{fact['description']}\n\n"
                    f"Question:\n{fact['question']}\n\n"
                    "Answer me with 'yes' or 'no'. Just 'yes' or 'no', no more other words, no more!"
                )
                questions.append(full_question)
                standard_answers.append(fact["answer"])
    
    return questions, standard_answers
