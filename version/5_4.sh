#!/bin/bash -e

# Build PHP 5.4.39
echo "============ Building PHP 5.4.39 =============="
php-build -i development --pear 5.4.39 $HOME/.phpenv/versions/5.4.39

# Setting phpenv to 5.4.39
echo "============ Setting phpenv to 5.4.39 ============"
phpenv rehash 
phpenv global 5.4.39

# Install Composer
echo "============ Installing Composer ============"
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer

# Install php extensions
echo "=========== Installing PHP extensions =============="
printf '\n' | pecl install memcache
printf '\n' | pecl install memcached
printf '\n' | pecl install mongo
printf '\n' | pecl install amqp
printf '\n' | pecl install zmq-beta
printf '\n' | pecl install redis

