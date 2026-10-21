# Backend PHP (Slim + Eloquent) do módulo Cadastros, gerado pelo Vycanis.
FROM alpine:3.20 AS fontes
COPY fontes/backend/php/vycanis/vendor.zip fontes/backend/php/vycanis/cadastros.zip /tmp/
RUN mkdir -p /api/cadastros \
	&& cd /api && unzip -q /tmp/vendor.zip 'vendor/*' \
	&& cd /api/cadastros && unzip -q /tmp/cadastros.zip

FROM php:8.1-apache
RUN docker-php-ext-install pdo_mysql && a2enmod rewrite headers

COPY --from=fontes /api /var/www/html/api
COPY deploy/cadastros/php.ini /usr/local/etc/php/conf.d/erp.ini
COPY deploy/cadastros/apache.conf /etc/apache2/conf-enabled/erp.conf

ENV APP_BASE_PATH=/api/cadastros
