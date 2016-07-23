#!/usr/bin/env bash

python manage.py migrate --noinput

python manage.py collectstatic --noinput

# debugging with default server uncomment this and comment the gunicorn one
#python manage.py runserver 0.0.0.0:3000 --settings=$DJANGO_SETTINGS_MODULE

exec  gunicorn --bind=0.0.0.0:80 gsma_hackathon.wsgi \
        --workers=5\
        --log-level=info \
        --log-file=-\
        --access-logfile=-\
        --error-logfile=-\
        --timeout 30\
        --reload