from flask import Flask, request, jsonify
from exts import db
from flask_migrate import Migrate
from models import Testresult, Safety, Efficiency, multi_Accuracy,Questions
import config
from flask_cors import CORS
from Accuracy_evaluation.main import evaluate_accuracy
from model_use_ok import evaluate_efficiency
from bad_code import evaluate_safety
import os


app = Flask(__name__)

#绑定配置文件
app.config.from_object(config)

#绑定数据库
db.init_app(app)
migrate = Migrate(app,db)

#允许跨域请求
CORS(app)


#主页，用于展示排名，总体得分
@app.route("/index")
def home_page():
    results = Testresult.query.order_by(Testresult.score.desc()).all()
    models = []
    for result in results:
        model = {'name':f"{result.name}",'score':f"{result.score}"}
        models.append(model)
    return jsonify(models)

#详情页
@app.route("/test")
def test():
    name = request.args.get("name")
    choice = request.args.get("choice")
    data_list = {"data":[],"score":[]}
    #data:单个问题的数据，score:总体得分和详细数据

    result = Testresult.query.filter_by(name=name).first()
    if not result:

        result = Testresult(name=name)
        db.session.add(result)
        db.session.commit()

        # 准确度测评
        rule_map = ["inverse", "negation", "composite"]
        domain_map = ["culture", "geography", "history", "health", "mathematics", "nature", "people", "society", "technology"]
        for rule in rule_map[:1]:
            for domain in domain_map[:9]:
                results = evaluate_accuracy(rule, domain, name)
                model = multi_Accuracy(rule=rule,domain=domain,score=results['accuracy'],model_id=result.id)
                db.session.add(model)
                db.session.commit()

                for q in results['questions'][:10]:
                    question = Questions(question=q['question'][:255],answer=q['model_answer'][:255],model_answer=q['standard_answer'][:255],model_id=model.id)
                    db.session.add(question)
                db.session.commit()


        # 效率测评
        E_results = evaluate_efficiency(model_name=name)
        result.score = E_results['summary']['accuracy']
        result.E_score = E_results['summary']['accuracy']
        result.avg_memory_usage = E_results['summary']['avg_memory_usage']
        result.avg_gpu_utilization = E_results['summary']['avg_gpu_utilization']
        for model in E_results['results']:
            efficiency = Efficiency(model_id=result.id,
                                    question=model['question'][:255],
                                    answer=model['answer'][:255],
                                    response_time=model['time_taken'],
                                    gpu_utilization=model['gpu_utilization'],
                                    memory_usage=model['memory_usage'])
            db.session.add(efficiency)
        db.session.commit()

        #安全测评
        S_results = evaluate_safety(model_name=name)
        result.S_score = S_results.unsafe_ratio
        safety = Safety(model_name=S_results['model_name'],
                        total_count=S_results['total_count'],
                        unsafe_count=S_results['unsafe_count'],
                        unsafe_ratio=S_results['unsafe_ratio'],
                        model_id=result.id)
        db.session.add(safety)
        db.session.commit()

    # 对数据进行封装
    if choice == "safety":
        models = Safety.query.filter_by(model_id=result.id).first()
        data = {
            "total_count":models.total_count,
            "unsafe_count":models.unsafe_count
        }
        data_list["data"].append(data)
        data_list["score"] = models.unsafe_ratio

    elif choice == "efficiency":
        models = Efficiency.query.filter_by(model_id=result.id).all()
        for model in models:
            data = {"question":model.question,
                    "answer":model.answer,
                    "response_time":model.response_time,
                    "gpu_utilization":model.gpu_utilization,
                    "memory_usage":model.memory_usage}
            data_list["data"].append(data)
        data_list["score"] = {"score":result.E_score,
                              "avg_gpu_utilization":result.avg_gpu_utilization,
                              "avg_memory_usage":result.avg_memory_usage}

    else:
        rule = request.args.get("rule")
        domain = request.args.get("domain")
        model = multi_Accuracy.query.filter_by(model_id=result.id,rule=rule,domain=domain).first()
        questions = Questions.query.filter_by(model_id=model.id)
        for q in questions:
            data = {"question":q.question,
                    "answer":q.answer,
                    "model_answer":q.model_answer}
            data_list["data"].append(data)
        data_list["score"] = model.score

    return jsonify([data_list])


#多维度数据图形展示页，传入模型名称，返回各维度相应的数据
@app.route("/graph")
def graph():
    name = request.args.get("model")
    result = Testresult.query.filter_by(name=name).first()

    data_list = {}

    rule_map = ["inverse", "negation", "composite"]
    for rule in rule_map:
        models = multi_Accuracy.query.filter_by(model_id=result.id,rule=rule).all()
        label = []
        value = []
        for model in models:
            label.append(model.domain)
            value.append(model.score)
        data = {"value": value, "label": label}
        data_list[f'{rule}'] = data


    return jsonify([data_list])


if __name__ == '__main__':
    app.run(debug=True,host="10.12.172.44",port=5000)
