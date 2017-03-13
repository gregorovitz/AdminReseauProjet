FROM ubuntu:latest
MAINTAINER Scuflaire Thomas <t.scuflaire@students.ephec.be>


# Installation d'apache et des autres programmes nécessaire
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur


RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    libicu-dev \
     libxml2-dev \
    vim \
        wget \
        unzip \
        git \
    && docker-php-ext-install -j$(nproc) iconv intl xml soap mcrypt opcache pdo pdo_mysql mysqli mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

    
RUN sed -i 's/docker-php-\(ext-$ext.ini\)/\1/' /usr/local/bin/docker-php-ext-install

# Activation des mods php
RUN a2enmod php7.0
RUN a2enmod rewrite


# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Déclaration des variables d'environnement
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Exposer le port 80 à apache
EXPOSE 80


# Injecter les fichiers au bon endroit
ADD www /var/www/site1
ADD b2b /var/www/site2
ADD intranet /var/www/site3

# remplacer la config de base par la nouvelle
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# démarrer apache en tâche de fond
CMD /usr/sbin/apache2ctl -D FOREGROUND
