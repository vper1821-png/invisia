
FROM php:8.2-apache

RUN docker-php-ext-install pdo_mysql mysqli ftp
RUN a2enmod rewrite headers
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80



