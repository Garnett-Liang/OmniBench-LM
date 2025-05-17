# 效率

import time
import random
import psutil
from typing import List, Dict
from transformers import AutoTokenizer, AutoModelForCausalLM
from datasets import load_dataset
import torch
import json


def get_memory_usage():
    return psutil.virtual_memory().percent


def get_gpu_utilization():
    if torch.cuda.is_available():
        return torch.cuda.memory_allocated() / torch.cuda.get_device_properties(0).total_memory * 100
    return 0


def load_evaluation_dataset(dataset_name: str = "ceval/ceval-exam", subset: str = "computer_network") -> List[Dict]:
    """
    加载评测数据集
    Args:
        dataset_name: HuggingFace上的数据集名称
        subset: 数据集的子集名称
    """
    try:
        print("dataset")
        if "ceval" in dataset_name:
            dataset = load_dataset(dataset_name, name=subset)
        elif "mmlu" in dataset_name:
            dataset = load_dataset(dataset_name, subset)
        else:
            raise ValueError(f"Unsupported dataset: {dataset_name}")

        questions = []

        # 根据不同数据集格式进行处理
        if "ceval" in dataset_name:
            for item in dataset['test']:
                # 构建选项字典
                choices = [
                    item['A'],
                    item['B'],
                    item['C'],
                    item['D']
                ]

                questions.append({
                    "category": subset,  # 使用子集名称作为类别
                    "question": item['question'],
                    "choices": choices,  # 选项列表
                    "answer": item['answer'],  # 正确答案
                    "explanation": item.get('explanation', ''),  # 解释（如果有）
                    "language": "zh",
                    "type": "multiple_choice"
                })
        elif "mmlu" in dataset_name:
            for item in dataset['test']:
                questions.append({
                    "category": subset if subset else "general",
                    "question": item['question'],
                    "choices": item['choices'],
                    "answer": item['answer'],
                    "language": "zh",
                    "type": "multiple_choice"
                })

        return questions[:3]  # 为了测试先限制数量
    except Exception as e:
        print(f"加载数据集失败: {str(e)}")
        return [
            {
                "category": "mathtemaics",
                "question": "1 + 1 = ?",
                "choices": ["2", "3", "4", "5"],
                "answer": "A",
                "language": "en",
                "type": "multiple_choice"
            }
        ]


def calculate_efficiency_score(metrics: Dict) -> Dict:
    """
    计算模型效率评分
    参考 MLPerf Inference benchmarks 评分标准
    """
    scores = {}

    # 延迟评分 (基于响应时间，越短越好)
    # 假设理想响应���间是1秒以内
    latency_score = min(100, 100 / (metrics['avg_time'] + 0.1))

    # 吞吐量评分 (基于tokens/second)
    throughput = metrics['avg_tokens'] / metrics['avg_time']
    throughput_score = min(100, throughput / 100)  # 假设100 tokens/s是基准

    # 资源效率评分 (基于内存和GPU使用率)
    resource_score = 100 * (1 - (metrics['avg_memory_usage'] + metrics['avg_gpu_utilization']) / 200)

    # 综合评分
    scores = {
        'latency_score': round(latency_score, 2),
        'throughput_score': round(throughput_score, 2),
        'resource_efficiency_score': round(resource_score, 2),
        'overall_score': round((latency_score + throughput_score + resource_score) / 3, 2)
    }

    return scores


def query_model(question: Dict, model, tokenizer) -> Dict[str, any]:
    """
    查询模型并收集性能指标
    """
    if question.get('type') == 'multiple_choice':
        prompt = f"问题：{question['question']}\n选项：\n"
        for i, choice in enumerate(question['choices']):
            prompt += f"{chr(65 + i)}. {choice}\n"
        prompt += "请选择正确答案的选项字母。"
    else:
        prompt = question['question']

    inputs = tokenizer(prompt, return_tensors="pt", truncation=True, max_length=1024)
    input_length = len(inputs.input_ids[0])

    inputs = {k: v.to(model.device) for k, v in inputs.items()}

    start_time = time.time()
    with torch.no_grad():
        outputs = model.generate(**inputs, max_new_tokens=100, do_sample=True, top_p=0.95, temperature=0.7)
    end_time = time.time()

    answer = tokenizer.decode(outputs[0], skip_special_tokens=True)
    answer = answer[len(prompt):].strip()

    return {
        "answer": answer,
        "expected_answer": question.get('answer', ''),
        "time_taken": end_time - start_time,
        "input_tokens": input_length,
        "output_tokens": len(outputs[0]) - input_length,
        "memory_usage": get_memory_usage(),
        "gpu_utilization": get_gpu_utilization()
    }


def evaluate_model(model_name, dataset_name="ceval/ceval-exam", subset=None):
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    tokenizer.pad_token = tokenizer.unk_token

    model = AutoModelForCausalLM.from_pretrained(
        model_name,
        trust_remote_code=True,
        device_map="auto",
        torch_dtype=torch.float16
    )

    questions = load_evaluation_dataset(dataset_name, subset)
    results = []

    total_memory = 0
    total_gpu = 0

    for q in questions:
        result = query_model(q, model, tokenizer)
        total_memory += result['memory_usage']
        total_gpu += result['gpu_utilization']
        print("+1")
        print(q['question'])
        results.append({
            "category": q['category'],
            "language": q.get('language', 'unknown'),
            "type": q.get('type', 'unknown'),
            "question": q['question'],
            "answer": result['answer'][:100] + "...",
            "expected_answer": result['expected_answer'],
            "time_taken": result['time_taken'],
            "input_tokens": result['input_tokens'],
            "output_tokens": result['output_tokens'],
            "memory_usage": result['memory_usage'],
            "gpu_utilization": result['gpu_utilization']
        })
        print(q['question'])
        print("Original question:", results[0]['question'])

    # 计算评测指标
    accuracy = sum(1 for r in results if r['answer'].strip().upper().startswith(r['expected_answer'])) / len(results)

    metrics = {
        "dataset": dataset_name,
        "subset": subset,
        "accuracy": accuracy,
        "avg_time": sum(r['time_taken'] for r in results) / len(results),
        "avg_tokens": sum(r['input_tokens'] + r['output_tokens'] for r in results) / len(results),
        "avg_memory_usage": total_memory / len(results),
        "avg_gpu_utilization": total_gpu / len(results),
        "total_questions": len(results)
    }

    # 计算效率评分
    efficiency_scores = calculate_efficiency_score(metrics)
    metrics['efficiency_scores'] = efficiency_scores

    return {
        # "individual_results": results,
        "summary": metrics,
        "results": results
    }


def evaluate_efficiency(model_name):
    # 可以评测多个数据集
    datasets_to_evaluate = [
        ("ceval/ceval-exam", "computer_network"),  # CEval计算机网络题目
    ]

    all_results = {}
    for dataset_name, subset in datasets_to_evaluate:
        print(f"Evaluating {dataset_name} {subset if subset else ''}")
        results = evaluate_model(model_name=model_name, dataset_name=dataset_name, subset=subset)
        all_results[f"{dataset_name}_{subset if subset else 'all'}"] = results
    return all_results["ceval/ceval-exam_computer_network"]


if __name__ == "__main__":

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
    
        modelname = model_map.get(model_choice)

    print(evaluate_efficiency(model_name=modelname))
