# Build stage
FROM composer:2 as build
WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader

# Production stage
FROM php:8.1-apache
WORKDIR /var/www/html

# Install PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip unzip && \
    docker-php-ext-install pdo_mysql gd && \
    a2enmod rewrite

# Copy app files
COPY --from=build /app /var/www/html
COPY .env.example /var/www/html/.env

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 777 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose port
EXPOSE 8080
