# 配置文件

# 数据库配置
host = '127.0.0.1'
port = 3306
username = 'root'
passwd = '123456'
database = 'testdb'
DB_URI = f"mysql+pymysql://{username}:{passwd}@{host}:{port}/{database}?charset=utf8"

SQLALCHEMY_DATABASE_URI = DB_URI
