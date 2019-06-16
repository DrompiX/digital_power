import notifier
import atexit

from flask import Flask
from flask_mail import Mail
from apscheduler.schedulers.background import BackgroundScheduler


def launch_app(config_file):
    flask_app = Flask(__name__)
    flask_app.config.from_object(config_file)

    mail.init_app(flask_app)

    from app import api_bp
    flask_app.register_blueprint(api_bp, url_prefix='/api')

    from models import db
    db.init_app(flask_app)

    return flask_app


mail = Mail()
app = launch_app('config')


if __name__ == '__main__':
    # scheduler = BackgroundScheduler()
    # scheduler.add_job(func=notifier.notify, trigger='interval', seconds=10)
    # scheduler.start()
    # atexit.register(lambda: scheduler.shutdown())
    app.run(debug=True, host='0.0.0.0')  # , use_reloader=False)
