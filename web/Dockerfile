
FROM php:8.2-apache



RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libxml2-dev \
    && docker-php-ext-install \
        pdo_mysql \
        mysqli \
        ftp \
        curl \
        dom \
        simplexml \
        mbstring \
    && a2enmod rewrite headers





RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80



