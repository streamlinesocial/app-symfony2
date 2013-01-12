#!/bin/bash

# ensure we dump everything
php public/app/console cache:clear --env=prod --no-debug
# php public/app/console assetic:dump --env=prod --no-debug
# php public/app/console cache:clear --env=prod --no-debug

# be sure to setup cache folders again
php public/app/console cache:warmup --env=prod --no-debug

# symfony / ACL
# http://symfony.com/doc/current/book/installation.html
#
# @todo: add check to see if it's possible to do this
# on some env's (e.g. a vagrant nfs share in centos 6.3) it throws an error
# ensure permissions on the required directories
# chmod +a "$APACHE_USER allow delete,write,append,file_inherit,directory_inherit" public/app/cache public/app/logs
# chmod +a "`whoami` allow delete,write,append,file_inherit,directory_inherit" public/app/cache public/app/logs

echo "Ensure server has permissions to write to the logs / cache"
for DIR in "public/app/cache" "public/app/logs"
do
    # test the dir exists
    if [ -d "$DIR" ]; then
        chmod 0777 -R $DIR
    fi
done
