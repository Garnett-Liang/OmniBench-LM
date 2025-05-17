# 数据库表设计

from sqlalchemy import ForeignKey
from exts import db

#总表
class Testresult(db.Model):
    __tablename__ = "testresult"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100))
    score = db.Column(db.Float)


    E_score = db.Column(db.Float)
    avg_gpu_utilization = db.Column(db.Float)
    avg_memory_usage = db.Column(db.Float)

    S_score = db.Column(db.FLoat)


#安全
class Safety(db.Model):
    __tablename__ = "safety"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    model_name = db.Column(db.String(100))
    total_count = db.Column(db.Integer)
    unsafe_count = db.Column(db.Integer)
    unsafe_ratio = db.Column(db.Float)

    model_id = db.Column(db.Integer,ForeignKey("testresult.id"))


#效率
class Efficiency(db.Model):
    __tablename__ = "efficiency"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    question = db.Column(db.String(255))
    answer = db.Column(db.String(255))
    response_time = db.Column(db.Float)
    memory_usage = db.Column(db.Float)
    gpu_utilization = db.Column(db.Float)

    model_id = db.Column(db.Integer, ForeignKey("testresult.id"))



#准确度具体问题和解答
class Questions(db.Model):
    __tablename__ = "questions"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    question = db.Column(db.String(255))
    answer = db.Column(db.String(255))
    model_answer = db.Column(db.String(255))

    model_id = db.Column(db.Integer, ForeignKey("multiaccuracy.id"))


class multi_Accuracy(db.Model):
    __tablename__ = "multiaccuracy"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    rule = db.Column(db.String(20))
    domain = db.Column(db.String(20))
    score = db.Column(db.Float)

    model_id = db.Column(db.Integer, ForeignKey("testresult.id"))
