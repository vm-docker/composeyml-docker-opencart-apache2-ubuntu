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
    
