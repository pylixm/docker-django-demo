#!/usr/bin/env bash

celery -A docker_django_demo worker -l info --logfile=/var/logs/celery.log