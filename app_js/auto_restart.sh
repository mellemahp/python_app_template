#!/bin/ash

watchmedo auto-restart -d /app -R -- uwsgi --ini /app/wsgi.ini &
npm run dev-server & 

wait %1 %2 %3