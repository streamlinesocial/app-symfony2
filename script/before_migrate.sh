#!/bin/bash

# if we have a fresh install
if [ ! -d public ]
then
    SYMFONY_VERSION='2.1.3'
    composer create-project symfony/framework-standard-edition public $SYMFONY_VERSION
fi

# install vendor files
composer install --working-dir=public

# create_dirs_before_symlink
mkdir -p public/app/cache
mkdir -p public/app/logs
mkdir -p public/app/config
# mkdir -p public/web/css

rm -rf public/app/cache/*
rm -rf public/app/logs/*
