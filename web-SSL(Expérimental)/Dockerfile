FROM ubuntu:latest
MAINTAINER Scuflaire Thomas <t.scuflaire@students.ephec.be>

# Installation d'apache et des autres programmes nécessaire
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur

# Activation des mods php
RUN a2enmod php7.0
RUN a2enmod rewrite

# creation certificat ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -out /etc/apache2/server1.crt -keyout /etc/apache2/server1.key -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=www.wt17.ephec-ti.be"
RUN chmod o-rw /etc/apache2/server1.key

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -out /etc/apache2/server2.crt -keyout /etc/apache2/server2.key -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=b2b.wt17.ephec-ti.be"
RUN chmod o-rw /etc/apache2/server2.key

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -out /etc/apache2/server3.crt -keyout /etc/apache2/server3.key -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=intranet.wt17.ephec-ti.be"
RUN chmod o-rw /etc/apache2/server3.key

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.0/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.0/apache2/php.ini

# Déclaration des variables d'environnement
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Exposer le port 80 et 443 à apache
EXPOSE 80
EXPOSE 443

# Injecter les fichiers au bon endroit
ADD www /var/www/site1
ADD b2b /var/www/site2
ADD intranet /var/www/site3

# remplacer la config de base par la nouvelle
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD apache-config.conf /etc/apache2/sites-enabled/default-ssl.conf

RUN a2enmod ssl
# démarrer apache en tâche de fond
CMD /usr/sbin/apache2ctl -D FOREGROUND
