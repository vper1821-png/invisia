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

# Descargar PHPMailer directamente (sin Composer)
RUN cd /tmp && \
    curl -L https://github.com/PHPMailer/PHPMailer/archive/refs/tags/v6.9.1.tar.gz | tar xz && \
    mkdir -p /var/www/html/vendor/phpmailer/phpmailer && \
    cp -r PHPMailer-6.9.1/src/* /var/www/html/vendor/phpmailer/phpmailer/ && \
    rm -rf PHPMailer-6.9.1


RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

