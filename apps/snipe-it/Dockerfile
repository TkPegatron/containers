FROM docker.io/snipe/snipe-it:${VERSION}

# Install shadow utilities
RUN apk add --no-cache shadow catatonit

# Reassign Apache's UID and GID
RUN \
  usermod -u 5540 apache \
  && groupmod -g 5540 apache

# Change ownership
RUN /bin/true \
  && chown -R apache:apache "/var/www/html" \
  && chown apache:apache "/run/apache2" \
  && chown -hR apache:apache "/var/www/html/storage/" \
  && chown -R apache:apache "/var/lib/snipeit" \
  && chown -R apache:apache "/var/log/apache2" \
  && chown apache:apache "/var/www/.composer"

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
