FROM docker.io/snipe/snipe-it:v6.2.0-alpine@sha256:e3c2c5672def50ac9140f50d7457e710b8829ae85f1af51a1e3a293187a64a52 as upstream
FROM ghcr.io/tkpegatron/alpine:rolling

# Install Apache and PHP
RUN apk add --no-cache \
        apache2 \
        php81 \
        php81-common \
        php81-apache2 \
        php81-curl \
        php81-ldap \
        php81-mysqli \
        php81-gd \
        php81-xml \
        php81-mbstring \
        php81-zip \
        php81-ctype \
        php81-tokenizer \
        php81-pdo_mysql \
        php81-openssl \
        php81-bcmath \
        php81-phar \
        php81-json \
        php81-iconv \
        php81-fileinfo \
        php81-simplexml \
        php81-session \
        php81-dom \
        php81-xmlwriter \
        php81-xmlreader \
        php81-sodium \
        php81-redis \
        php81-pecl-memcached \
        curl wget git \
        mysql-client

# Hardlink php81 for the entrypoint
RUN ln -s /usr/bin/php81 /usr/bin/php

# Reassign Apache's UID and GID
RUN \
  usermod -u 5540 apache \
  && groupmod -g 5540 apache

RUN mkdir -p /run/apache2 && chown apache:apache /run/apache2

# Install files from upstream
COPY --from=upstream /etc/mysql/conf.d/column-statistics.cnf /etc/mysql/conf.d/column-statistics.cnf
COPY --from=upstream /etc/apache2/conf.d/default.conf /etc/apache2/conf.d/default.conf
COPY --from=upstream /etc/apache2/httpd.conf /etc/apache2/httpd.conf
COPY --from=upstream /var/www/html /var/www/html
COPY --from=upstream /var/www/html/.env /var/www/html/.env
COPY --from=upstream /entrypoint.sh /entrypoint.sh

# Change ownership of apache root
RUN chown -R apache:apache /var/www/html

# Softlink /var/www/ content to /var/lib/snipeit for persitent volume
RUN \
  # This portion comes from the upstream docker file
  rm -r "/var/www/html/storage/private_uploads" \
    && mkdir -p "/var/lib/snipeit/data/private_uploads" && ln -fs "/var/lib/snipeit/data/private_uploads" "/var/www/html/storage/private_uploads" \
    && rm -rf "/var/www/html/public/uploads" \
    && mkdir -p "/var/lib/snipeit/data/uploads" && ln -fs "/var/lib/snipeit/data/uploads" "/var/www/html/public/uploads" \
    && mkdir -p "/var/lib/snipeit/dumps" && rm -r "/var/www/html/storage/app/backups" && ln -fs "/var/lib/snipeit/dumps" "/var/www/html/storage/app/backups" \
    && mkdir -p "/var/lib/snipeit/keys" && ln -fs "/var/lib/snipeit/keys/oauth-private.key" "/var/www/html/storage/oauth-private.key" \
    && ln -fs "/var/lib/snipeit/keys/oauth-public.key" "/var/www/html/storage/oauth-public.key" \
    && chown -hR apache "/var/www/html/storage/" \
    && chown -R apache "/var/lib/snipeit" \
  # This portion is me
    && chown -R apache:apache "/var/log/apache2"

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir -p /var/www/.composer && chown apache /var/www/.composer

# Rewrite config files for rootlessness
RUN /bin/true \
  && sed -e 's/apache:root/apache:apache/g' -i /entrypoint.sh \
  && sed -e 's/^Listen 80/Listen 8080/g' -i /etc/apache2/httpd.conf \
  && sed -e 's/*:80/*:8080/g' -i /etc/apache2/conf.d/default.conf

#---{*Initialize*}---#

USER apache

WORKDIR /var/www/html

VOLUME ["/var/lib/snipeit"]

ENTRYPOINT ["/usr/bin/catatonit", "--"]

CMD ["/entrypoint.sh"]

EXPOSE 80
