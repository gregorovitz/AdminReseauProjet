FROM ubuntu:latest
MAINTAINER Scuflaire Thomas <t.scuflaire@students.ephec.be>

# Installation d'apache et des autres programmes nécessaire
RUN apt-get update && apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur

# Activation des mods php
RUN a2enmod php7.0
RUN a2enmod rewrite

# creation certificat ssl
RUN cd /etc/ssl
RUN openssl genrsa -out server.key 2048
RUN openssl req -new -key server.key -out server.csr -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=www.wt17.ephec-ti.be"
RUN openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Déclaration des variables d'environnement
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Exposer le port 443 à apache
EXPOSE 443

# Injecter les fichiers au bon endroit
ADD www /var/www/site1
ADD b2b /var/www/site2
ADD intranet /var/www/site3

# remplacer la config de base par la nouvelle
ADD apache-config.conf /etc/apache2/sites-enabled/default-ssl.conf

RUN a2ensite default-ssl.conf
RUN service apache2 restart
# démarrer apache en tâche de fond
CMD /usr/sbin/apache2ctl -D FOREGROUND
