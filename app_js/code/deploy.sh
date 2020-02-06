#!/bin/ash
echo "BEEP"
uwsgi --ini /app/wsgi.ini 2>&1