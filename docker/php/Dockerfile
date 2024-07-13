# Define environment variables
ARG PHP_IMAGE

# The FPM base container
FROM php:${PHP_IMAGE} AS php-dev

# Install necessary packages
RUN apt-get update \
    && apt-get install -qy \
      default-mysql-client \
      libmcrypt-dev \
      libpng-dev \
      libzip-dev \
      unzip \
      zlib1g-dev \
    && docker-php-ext-install \
      -j$(nproc) \
      gd \
      pdo_mysql \
      zip

WORKDIR /var/www

# Copy PHP configuration files
COPY ./docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/php.ini

# Copy your application source code
COPY ../src /var/www
