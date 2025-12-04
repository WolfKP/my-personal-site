FROM php:8.4-fpm-alpine

# Add composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Add Symfony CLI
COPY --link --from=ghcr.io/symfony-cli/symfony-cli:latest /usr/local/bin/symfony /usr/local/bin/symfony

# Copy over composer.json, composer.lock
COPY ./composer.* .

# Install dependencies
RUN composer install --no-interaction --no-progress --no-autoloader --no-scripts

# Copy over project file (vendor in .dockerignore)
COPY . .

RUN composer dump-autoload --optimize && composer run-script post-install-cmd
