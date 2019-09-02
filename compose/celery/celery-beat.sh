#!/usr/bin/env bash

celery -A docker_django_demo beat -l info --logfile=/var/logs/celery-beat.log