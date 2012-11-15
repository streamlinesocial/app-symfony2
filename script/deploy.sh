#!/bin/bash

echo "deploy.sh :: init"

# set sane defaults
export MYSQL_DB=${MYSQL_DB:-'symfony_dev'}
export MYSQL_USER=${MYSQL_USER:-'root'}
export MYSQL_PASS=${MYSQL_PASS:-''}
export MYSQL_HOST=${MYSQL_HOST:-'localhost'}
export APACHE_USER=${APACHE_USER:-`whoami`}
export APACHE_GROUP=${APACHE_GROUP:-`whoami`}

# dev to test vars out on screen
# echo "db:   $MYSQL_DB"
# echo "user: $MYSQL_USER"
# echo "pass: $MYSQL_PASS"
# echo "host: $MYSQL_HOST"
# echo "apache user:  $APACHE_USER"
# echo "apache group: $APACHE_GROUP"

# echo "Checking for public/app/config/parameters.ini file to exist..."
# if [ -e public/app/config/parameters.ini ]; then
#     echo "parameters.ini detected, continuing build."
# else
#     echo "parameters.ini could not be detected, exiting."
#     echo "Create the file as a file or symbolic link before retrying to install."
#     exit 1;
# fi

script/before_migrate.sh
script/migration.sh
script/before_restart.sh
