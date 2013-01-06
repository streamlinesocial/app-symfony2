#!/bin/bash

# find composer
COMPOSER_BIN=${COMPOSER_BIN:-'/usr/local/bin/composer'}
if command -v composer | grep -q composer$
then
    # composer in path
    echo "Found" > /dev/null
else
    # if we don't find composer in path so we need to download the phar now
    curl -s https://getcomposer.org/installer | php
    COMPOSER_BIN='./composer.phar'
fi

# if we have a fresh install
if [ ! -d public ]
then
    SYMFONY_VERSION='2.1.3'
    $COMPOSER_BIN create-project symfony/framework-standard-edition public $SYMFONY_VERSION
fi

# install vendor files
$COMPOSER_BIN install --working-dir=public

# create_dirs_before_symlink
mkdir -p public/app/cache
mkdir -p public/app/logs
mkdir -p public/app/config
# mkdir -p public/web/css

rm -rf public/app/cache/*
rm -rf public/app/logs/*
