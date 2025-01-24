# Step 1: Use Composer image to install dependencies
FROM composer:2 as build

WORKDIR /app

# Copy your composer files
COPY composer.json composer.lock ./

# Install PHP dependencies (this will download all the required libraries into the vendor folder)
RUN composer install --no-dev --optimize-autoloader --prefer-dist

# Step 2: Use PHP with Apache image to run the Laravel app
FROM php:8.0-apache

# Install PHP extensions required for Laravel (PDO, MySQL, etc.)
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql gd

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the application code from the build image to the web directory
COPY --from=build /app /var/www/html

# Set the correct permissions on the storage folder
RUN chmod -R 777 /var/www/html/storage /var/www/html/bootstrap/cache

# Expose the container port (Cloud Run default is 8080)
EXPOSE 8080

# Set environment variables for Laravel (these can be overridden by Cloud Run or local .env files)
ENV APP_ENV=production
ENV APP_KEY=base64:YOUR_APP_KEY

# Run the Apache server
CMD ["apache2-foreground"]
