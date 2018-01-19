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
