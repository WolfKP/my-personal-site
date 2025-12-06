FROM php:8.4-fpm-alpine

# Add composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy over composer.json, composer.lock
COPY ./app/composer.* .

# Install dependencies
RUN composer install --no-interaction --no-progress --no-autoloader --no-scripts

# Copy over project file (vendor in .dockerignore)
COPY ./app .

RUN composer dump-autoload --optimize && composer run-script post-install-cmd
