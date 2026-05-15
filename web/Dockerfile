FROM php:8.2-apache-bullseye

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libc-client-dev \
    libkrb5-dev \
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

# Establecer directorio de trabajo
WORKDIR /var/www/html

# Instalar PHPMailer con Composer
RUN composer require phpmailer/phpmailer


RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

