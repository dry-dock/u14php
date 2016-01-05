#!/bin/bash -e

# Build PHP 5.4.39
echo "============ Building PHP 5.4.39 =============="
php-build -i development 5.4.39 $HOME/.phpenv/versions/5.4.39

# Setting phpenv to 5.4.39
echo "============ Setting phpenv to 5.4.39 ============"
phpenv rehash
phpenv global 5.4.39

# Install Composer
echo "============ Installing Composer ============"
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer

echo "================================ PWD PWD PWD ================================"
pwd

#install pickle
cd /tmp/pickle
composer install

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | bin/pickle install memcache
printf '\n' | bin/pickle install memcached
printf '\n' | bin/pickle install mongo
printf '\n' | bin/pickle install amqp-1.6.0
printf '\n' | bin/pickle install zmq-beta
printf '\n' | bin/pickle install redis
cd /
