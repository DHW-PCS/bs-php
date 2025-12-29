FROM php:8.1-fpm-alpine

# 安装依赖扩展 (gd, pdo_mysql, zip, intl 等)
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd pdo_mysql zip intl bcmath opcache imagick

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# 设置工作目录
WORKDIR /bs