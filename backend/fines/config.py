import os

basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_ECHO = False
SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_DATABASE_URI = "sqlite:///fines.db"
MAIL_SERVER = 'smtp.mail.ru'
MAIL_PORT = 465
MAIL_USERNAME = 'digital.noreply@mail.ru'
MAIL_PASSWORD = 'digitalpower'
MAIL_DEFAULT_SENDER = 'digital.noreply@mail.ru'
MAIL_USE_TLS = False
MAIL_USE_SSL = True
