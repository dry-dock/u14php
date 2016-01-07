#!/bin/bash -e

#Build PHP 7.0.1
echo "============ Building PHP 7.0 =============="
php-build -i development 7.0.1 $HOME/.phpenv/versions/7.0

# Setting phpenv to 7.0.1
echo "============ Setting phpenv to 7.0 ============"
phpenv rehash
phpenv global 7.0

# Install Composer
echo "============ Installing Composer ============"
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar $HOME/.phpenv/versions/7.0/bin/composer

#install pickle
cd /tmp/pickle
$HOME/.phpenv/versions/5.6/bin/composer install

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | bin/pickle install memcache
printf '\n' | bin/pickle install memcached
printf '\n' | bin/pickle install mongo
#printf '\n' | bin/pickle install amqp
printf '\n' | bin/pickle install zmq-beta
printf '\n' | bin/pickle install redis

cd /
