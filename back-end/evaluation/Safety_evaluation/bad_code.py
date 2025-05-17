import pandas as pd
from datasets import load_dataset
from huggingface_hub import InferenceClient
from transformers import AutoTokenizer, AutoModelForCausalLM, pipeline
from tqdm import tqdm
import torch
def generate_answers(model_name: str, questions: list) -> list:
    """
    使用目标模型生成对问题的回答
    Args:
        model_name: HuggingFace模型ID
        questions: 问题列表
    Returns:
        对话格式的答案列表 [{"role": "user", "content": question}, {"role": "assistant", "content": answer}]
    """
    try:
        # 加载目标模型
        tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
        model = AutoModelForCausalLM.from_pretrained(model_name, 
                                                   trust_remote_code=True, 
                                                   device_map="auto",
                                                   torch_dtype=torch.bfloat16)
        
        # 创建生成管道
        text_generator = pipeline(
            "text-generation",
            model=model,
            tokenizer=tokenizer,
            device=0,
            max_new_tokens=300,
            truncation=True
        )

        chats_data = []
        for question in tqdm(questions, desc="Generating answers"):
            response = text_generator(question, num_return_sequences=1)
            generated_text = response[0]['generated_text'].replace(question, "").strip()
            
            chats_data.append([
                {"role": "user", "content": question},
                {"role": "assistant", "content": generated_text}
            ])
            
        return chats_data

    except Exception as e:
        raise ValueError(f"模型加载失败: {str(e)}")

def evaluate_with_llama_guard(chat_data: list) -> str:
    """
    使用Llama-Guard评估对话安全性
    Args:
        chat_data: 对话数据 [user_msg, assistant_msg]
    Returns:
        安全评估结果 ("safe" or "unsafe")
    """
    client = InferenceClient(model="meta-llama/Llama-Guard-3-8B")
    response = client.post(json={"inputs": chat_data})
    return response.lower()  # 返回标准化的小写结果

def load_advbench_dataset() -> list:
    """
    加载AdvBench对抗性测试集
    Returns:
        问题列表
    """
    dataset = load_dataset("llm-attacks/harmful-behaviors", split="train")
    return [item["goal"] for item in dataset]

def evaluate_safety(model_name: str, sample_size: int = 50) -> dict:
    """
    安全评估主函数
    Args:
        model_name: 待评估模型ID
        sample_size: 测试样本数量
    Returns:
        评估结果字典
    """
    # 1. 加载测试集
    print("Loading AdvBench dataset...")
    questions = load_advbench_dataset()[:sample_size]
    
    # 2. 生成目标模型回答
    print(f"Generating answers with {model_name}...")
    chats_data = generate_answers(model_name, questions)
    
    # 3. 安全评估
    print("Evaluating safety with Llama-Guard...")
    unsafe_count = 0
    for chat in tqdm(chats_data, desc="Evaluating"):
        result = evaluate_with_llama_guard(chat)
        if "unsafe" in result:
            unsafe_count += 1
    
    # 4. 计算结果
    total_count = len(chats_data)
    unsafe_ratio = unsafe_count / total_count if total_count > 0 else 0
    
    return {
        "model_name": model_name,
        "total_count": total_count,
        "unsafe_count": unsafe_count,
        "unsafe_ratio": f"{unsafe_ratio:.2%}",
        "test_set": "AdvBench",
        "evaluation_model": "Llama-Guard-3-8B"
    }

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
    
        model_name = model_map.get(model_choice)
    
        if model_name:
            print(f"已选择模型: {model_name}")
    results = evaluate_safety(model_name, sample_size=20)
    
    print("\nEvaluation Results:")
    print(f"Model: {results['model_name']}")
    print(f"Test Set: {results['test_set']} ({results['total_count']} samples)")
    print(f"Unsafe Responses: {results['unsafe_count']} ({results['unsafe_ratio']})")
    print(f"Evaluated by: {results['evaluation_model']}")