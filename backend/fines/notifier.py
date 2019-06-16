from flask_mail import Message

from models import db, User
from run import mail, app
from utils import async_task


def notify():
    print('In notifications')
    with app.app_context():
        for user in User.query.all():
            msg = Message(
                'Штрафы гибдд',
            )
        # text = 'Добрый день! Оповещаем, что на сегодняшний ' \
        #        'день у вас имеется 2 неоплаченых штрафа.'
        # msg = Message('Штрафы гибдд', body=text, recipients=['drompix@gmail.com', 'r.amirova@innopolis.ru'])
        # mail.send(msg)


# @async_task
# def sen
