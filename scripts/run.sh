#!/bin/sh

set -e  #  neu 1 cau lenh fail thi tat ca fail

python manage.py wait_for_db
python manage.py collectstatic --noinput  #  collect tat ca static file (cua tat ca app) sau do put vao 1 dir dc config truoc
# -> make dir accessable boi Nginx proxy
python manage.py migrate

uwsgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi
#  run uwsgi service | on TCP socket at port 9000 -> nginx connect vao app | run tren 4 worker uwsgi |
#  neu code su dung multithread -> su dung thong qua wsgi service | run app/wsgi.py