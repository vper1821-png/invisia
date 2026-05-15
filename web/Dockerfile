FROM php:8.2-apache-bullseye

# Instalar extensiones y herramientas necesarias (incluye git y unzip para Composer)
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libc-client-dev \
    libkrb5-dev \
    unzip \
    git \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        imap \
        pdo_mysql \
        mysqli \
        mbstring \
        ftp \
    && a2enmod rewrite headers

RUN apt-get update && apt-get install -y whois

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Crear composer.json con la dependencia PHPMailer
RUN echo '{"require":{"phpmailer/phpmailer":"^6.9"}}' > composer.json

# Instalar dependencias (generará vendor/autoload.php)
RUN composer install --no-interaction --no-progress --no-dev

# Limpiar caché de Composer para reducir tamaño
RUN composer clear-cache


RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

