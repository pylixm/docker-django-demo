#!/usr/bin/env bash

set -o errexit
set -o pipefail

# todo: turn on after #1295
# set -o nounset


cmd="$@" # all params

# This entrypoint is used to play nicely with the current cookiecutter configuration.
# Since docker-compose relies heavily on environment variables itself for configuration, we'd have to define multiple
# environment variables just to support cookiecutter out of the box. That makes no sense, so this little entrypoint
# does all this for us.
# export REDIS_URL=redis://redis:6379

# the official postgres image uses 'postgres' as default user if not set explictly.
#if [ -z "$POSTGRES_USER" ]; then
#    export POSTGRES_USER=postgres
#fi
# export DATABASE_URL=postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@postgres:5432/$POSTGRES_USER
# export CELERY_BROKER_URL=$REDIS_URL/0

echo $(date '+%Y-%m-%d %H:%M:%S')
echo $MYSQL_ROOT_PASSWORD
echo $MYSQL_DATABASE
echo $cmd

function mysql_ready(){
python << END
import sys
import pymysql
try:
    conn = pymysql.connect(host="db", port=3306, user="root", passwd="$MYSQL_ROOT_PASSWORD", db='$MYSQL_DATABASE', charset='utf8')
except pymysql.err.OperationalError:
    sys.exit(-1)
sys.exit(0)
END
}

until mysql_ready; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - continuing..."

exec $cmd
