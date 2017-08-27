#!/usr/bin/env bash

JAVA_OPTIONS="$1"

MYSQL_PORT=3306
MYSQL_HOST=reactor.db
MYSQL_USER=reactor
MYSQL_PASS=reactor

until mysql -h"${MYSQL_HOST}" -P"${MYSQL_PORT}" -u"${MYSQL_USER}" -p"${MYSQL_PASS}" &> /dev/null
do
  printf "."
  sleep 1
done

java $JAVA_OPTIONS -jar build/libs/reactor-test.jar
