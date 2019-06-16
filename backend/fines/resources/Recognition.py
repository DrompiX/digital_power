from flask import request, send_file
from flask_restful import Resource


class RecognitionResource(Resource):

    @staticmethod
    def get():
        return {}, 200

    @staticmethod
    def post():
        print(request.files)
        file = request.files['file1'].read()
        return {'message': 'file received'}, 200
