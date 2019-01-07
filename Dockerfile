# Dockerfile
FROM php:7.1.12-apache

MAINTAINER Kelly Ferrone <kelly@webaholics.co>

COPY build/config/php.ini /usr/local/etc/php/
COPY build/config/php.ini /usr/local/etc/php/conf.d/
COPY application/ /var/www/html

RUN apt-get update

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

EXPOSE 80
EXPOSE 443