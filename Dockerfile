FROM php:8.5-apache

# Instal ekstensi MySQL (mysqli dan pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo_mysql

# Aktifkan mod_rewrite Apache (berguna jika memakai .htaccess)
RUN a2enmod rewrite

# Salin seluruh file proyek PHP ke folder root Apache
COPY . /var/www/html/

# Berikan izin akses folder kepada user Apache
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
