from flask import request, send_file
from flask_restful import Resource

from detection import main


class RecognitionResource(Resource):

    @staticmethod
    def get():
        return {}, 200

    @staticmethod
    def post():
        file = request.files['file'].save('test.png')
        score = main.compute_cosine_distance('test.png')
        if score > 0.7:
            result = 'denied'
        elif score < 0.5:
            result = 'accepted'
        else:
            result = 'not sure'
        print('Score =', score, '| Result = ', result)

        return {'message': score, 'result': result}, 200
