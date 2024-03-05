echo "--------------------------------"
echo "--Start Instaling Dependencies--"
echo "--------------------------------"


docker run --rm \
  -v "$(dirname $(readlink -f $0))/src:/var/www/html" \
  -w /var/www/html \
  laravelsail/php74-composer:latest \
  bash -c '
    apt-get update && apt-get install -y libpng-dev libzip-dev && \
    docker-php-ext-install gd zip && \
    composer update && \
    composer install && \
    cp .env.example .env && \
    chmod -R 777 storage && \
    php artisan key:generate
  '
