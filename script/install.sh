#!/bin/bash

#
# usage: MYSQL_DB=dbname MYSQL_NAME=root MYSQL_PASS="asdf" MYSQL_HOST="localhost" script/install.sh
#

echo "install.sh :: init"
# echo "db:   $MYSQL_DB"
# echo "user: $MYSQL_USER"
# echo "pass: $MYSQL_PASS"
# echo "host: $MYSQL_HOST"
# echo "apache user:  $APACHE_USER"
# echo "apache group: $APACHE_GROUP"

# setup db connection string
DBC="--user=$MYSQL_USER --password=$MYSQL_PASS --host=$MYSQL_HOST"

# data/backup/initial.sql can be used for dev
# LOCAL_DB_FILE='data/backup/initial.sql'

# first check if we need to install
if mysql $DBC --skip-column-names --batch -e "show databases like '$MYSQL_DB';" | grep -qi ^$MYSQL_DB\$; then

    echo "install.sh :: not installing ($DBC)"

else

    echo "install.sh :: installing ($DBC)"

    # create database, exit's non-zero if it fails
    php public/app/console doctrine:database:create
    php public/app/console doctrine:schema:create
fi
