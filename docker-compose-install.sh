#!/bin/bash

# nginx
mkdir -p $HOME/nginx/{etc,www}
cp -r ./nginx/etc/. $HOME/nginx/etc

# php-fpm
mkdir -p $HOME/php/{etc}
cp -r ./php-fpm/etc/. $HOME/php/etc

# redis
mkdir -p $HOME/redis/etc
cp -r ./redis/etc/. $HOME/redis/etc
