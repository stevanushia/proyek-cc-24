# Use a Composer image with PHP 8.3 for the build stage
FROM composer:2.6 AS build

# Set the working directory
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Use a PHP 8.3 image with Apache for the production stage
FROM php:8.3-apache

# Install necessary PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-enable opcache

RUN docker-php-ext-install pdo pdo_mysql

# Set the Apache port
EXPOSE 8080

# Copy the application code from the build stage
COPY --from=build /app /var/www/html

# Copy the Apache configuration file
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

# Copy the environment file and ensure proper permissions
COPY .env.example /var/www/html/.env
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache && \
    chown -R www-data:www-data /var/www/html && \
    echo "Listen 8080" >> /etc/apache2/ports.conf && \
    a2enmod rewrite

# Set the default working directory
WORKDIR /var/www/html
