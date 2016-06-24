FROM ubuntu:12.04
MAINTAINER Findaway

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      apache2 \
      apache2-mpm-prefork \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-mysql \
    && rm -r /var/lib/apt/lists/*

COPY apache_default /etc/apache2/sites-available/default
COPY apache2_foreground /usr/local/bin/
RUN a2enmod rewrite

EXPOSE 80
CMD ["apache2_foreground"]
