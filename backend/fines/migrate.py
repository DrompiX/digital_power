from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from models import db
from run import launch_app

app = launch_app('config')

migrate = Migrate(app, db)
manager = Manager(app)
manager.add_command('db', MigrateCommand)


if __name__ == '__main__':
    manager.run()
