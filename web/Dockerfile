
FROM php:8.2-apache

# 🔥 dependencias base del sistema
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 🔥 extensiones PHP
RUN docker-php-ext-install pdo_mysql mysqli

# 🔥 apache mods
RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80



