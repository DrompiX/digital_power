from flask import request, send_file
from flask_restful import Resource

# from detection import main


class RecognitionResource(Resource):

    @staticmethod
    def get():
        return {}, 200

    @staticmethod
    def post():
        print(request.files)
        file = request.files['file1'].save('test.png')
        # res = main.compute_cosine_distance('test.png')
        # print(res)
        # TODO: feed files into model

        return {'message': 'success'}, 200
