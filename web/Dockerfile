MAINTAINER Scuflaire Thomas <t.scuflaire@students.ephec.be>

FROM php:7.1-apache

# Installation des modules nécessaires
RUN apt-get update && apt-get install -y locales git-core libsqlite3-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libpq-dev libexif-dev libmcrypt-dev libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-install gd mysqli pdo pdo_mysql pdo_sqlite pdo_pgsql json

# Activation des mods php
RUN a2enmod php7
RUN a2enmod rewrite

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
