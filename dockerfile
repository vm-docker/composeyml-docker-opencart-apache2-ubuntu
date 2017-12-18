FROM lzrbear/docker-apache2-ubuntu
MAINTAINER Sameer Saini (sameer.saini@outlook.com)


#https://hostpresto.com/community/tutorials/how-to-install-opencart-on-ubuntu-16-04/

#install dependencies

#install php
RUN apt-get update

#Add php7.0 repo
RUN apt-get install -y --no-install-recommends \
	software-properties-common
RUN apt-add-repository ppa:ondrej/php
RUN apt-get update

#install php7.0
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

#install mariadb
#RUN apt-get update \
#	&& apt-get install -y --no-install-recommends \
#		mariadb-server
		
#RUN systemctl start mysql

#RUN systemctl enable mysql

#RUN echo "& y y kY%2\%Mv76`S5dY} kY%2\%Mv76`S5dY} y y y y" | mysql_sercue_installation

#setup mariadb


#install opencart
RUN wget https://github.com/opencart/opencart/releases/download/3.0.2.0/3.0.2.0-OpenCart.zip

RUN unzip 3.0.2.0-OpenCart.zip -d OpenCart
RUN mv -v OpenCart/upload /var/www/html/opencart

RUN chown -R www-data:www-data /var/www/html/opencart
RUN chmod -R 777 /var/www/html/opencart

RUN mv /var/www/html/opencart/config-dist.php /var/www/html/opencart/config.php
RUN mv /var/www/html/opencart/admin/config-dist.php /var/www/html/opencart/admin/config.php

#Expose for http
EXPOSE 80
