from flask import Blueprint
from flask_restful import Api
import resources

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Routes
api.add_resource(resources.UserResource, '/user')
