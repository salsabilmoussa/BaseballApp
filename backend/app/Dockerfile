FROM php:8.2-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libzip-dev \
    libssl-dev \
    librdkafka-dev \
    && docker-php-ext-install \
    pdo_pgsql \
    zip \
    sockets

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install Kafka extension
RUN pecl install rdkafka \
    && docker-php-ext-enable rdkafka

WORKDIR /app

# Copy composer files and install dependencies
COPY composer.json composer.lock ./
RUN composer install --prefer-dist --no-scripts --no-autoloader

# Copy application files
COPY . .

# Generate autoload files
RUN composer dump-autoload --optimize

# Expose port for Symfony
EXPOSE 8001
# Start Symfony app
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
