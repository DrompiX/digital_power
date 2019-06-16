from marshmallow import fields
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    access_token = db.Column(db.String(50), nullable=False, unique=True)
    email = db.Column(db.String, nullable=True)
    phone = db.Column(db.String, nullable=True)
    active = db.Column(db.Boolean)
    service = db.Column(db.String)  # NULL, email, sms
    car_id = db.Column(db.String)

    def __init__(self, access_token: str, service: str, car_id: str,
                 email: str = None, phone: str = None,):
        self.access_token = access_token
        self.email = email
        self.phone = phone
        self.service = service
        self.car_id = car_id
        self.active = True


class UserSchema(ma.Schema):
    id = fields.Integer(dump_only=True)
    access_token = fields.String(required=True)
    email = fields.String(required=True, allow_none=True)
    phone = fields.String(required=True, allow_none=True)
    service = fields.String(required=True)
    car_id = fields.String(required=True)
    active = fields.Boolean(required=False)
