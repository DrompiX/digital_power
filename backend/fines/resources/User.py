from flask import request
from flask_restful import Resource
from models import db, User, UserSchema

users_schema = UserSchema(many=True)
user_schema = UserSchema()


class UserResource(Resource):

    @staticmethod
    def get():
        users = User.query.all()
        users = users_schema.dump(users).data
        return {'data': users}, 200

    @staticmethod
    def post():
        json_data = request.get_json(force=True)
        if not json_data:
            return {'message': 'No input data'}, 400
        print(json_data)

        data, errors = user_schema.load(json_data)
        if errors:
            return errors, 422

        user = User.query.filter_by(access_token=data['access_token']).first()
        if user:
            return {'message': 'User already exists'}, 400

        user = User(
            access_token=data['access_token'],
            email=data['email'],
            phone=data['phone'],
            service=data['service'],
        )

        db.session.add(user)
        db.session.commit()

        result = user_schema.dump(user).data

        return {'data': result}, 201
