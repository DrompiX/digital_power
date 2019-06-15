from flask import Flask


def launch_app(config_file):
    flask_app = Flask(__name__)
    flask_app.config.from_object(config_file)

    from app import api_bp
    flask_app.register_blueprint(api_bp, url_prefix='/api')

    from models import db
    db.init_app(flask_app)

    return flask_app


if __name__ == '__main__':
    app = launch_app('config')
    app.run(debug=True, host='0.0.0.0')
