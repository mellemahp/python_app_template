#!/bin/ash

watchmedo auto-restart -d /app -R -- uwsgi --ini /app/wsgi.ini

wait %1 %2 %3