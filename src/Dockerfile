FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    libzip-dev \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    libxml2-dev \
    default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql mysqli gd zip

RUN mkdir -p /var/www/html
COPY . /var/www/html
WORKDIR /var/www/html

RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 777 /var/www/html/storage/

EXPOSE 9000
CMD ["php-fpm"]
