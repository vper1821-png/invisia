
FROM php:8.2-apache

RUN docker-php-ext-install pdo_mysql mysqli
RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80



