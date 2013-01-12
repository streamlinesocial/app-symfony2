#!/bin/bash

# ensure the app is installed
script/deploy/install.sh

# run database migrations
# php public/app/console doctrine:migration:migrate --no-interaction
