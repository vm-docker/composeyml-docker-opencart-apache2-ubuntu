FROM lzrbear/docker-apache2-ubuntu
MAINTAINER Sameer Saini (sameer.saini@outlook.com)


#https://hostpresto.com/community/tutorials/how-to-install-opencart-on-ubuntu-16-04/

#Update repos
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
	software-properties-common

#Add php7.0 repo
RUN apt-add-repository ppa:ondrej/php
RUN apt-get update

#Install php7.0
RUN apt-get install -y --force-yes --no-install-recommends \
		wget \
		unzip \
		php7.0-mysql \
		php7.0-curl \
		php7.0-json \
		php7.0-cgi \
		php7.0 \
		libapache2-mod-php7.0 \
		php7.0-mcrypt \
		php7.0-gd \
		php7.0-zip
		
#TODO: fix php file /etc/php/7.0/cli/php.ini

#Install OpenCart
RUN wget https://github.com/opencart/opencart/releases/download/3.0.2.0/3.0.2.0-OpenCart.zip
RUN unzip 3.0.2.0-OpenCart.zip -d OpenCart
RUN mv -v OpenCart/upload /var/www/html/opencart

#Configure OpenCart
RUN chown -R www-data:www-data /var/www/html/opencart
RUN chmod -R 777 /var/www/html/opencart

RUN mv /var/www/html/opencart/config-dist.php /var/www/html/opencart/config.php
RUN mv /var/www/html/opencart/admin/config-dist.php /var/www/html/opencart/admin/config.php

# Clean Up
RUN apt-get remove -y \
        wget \
        unzip \
    && rm -r /var/lib/apt/lists/*

#Expose for http
EXPOSE 80
