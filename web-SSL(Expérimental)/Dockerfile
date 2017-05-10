FROM ubuntu:latest
MAINTAINER Scuflaire Thomas <t.scuflaire@students.ephec.be>

# Installation d'apache et des autres programmes nécessaire
RUN apt-get update && apt-get -y install \
    apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 curl lynx-cur

# Activation des mods php
RUN a2enmod php7.0
RUN a2enmod rewrite
RUN a2enmod ssl

# creation certificat ssl
RUN cd /etc/ssl

RUN openssl genrsa -out server1.key 2048
RUN openssl req -new -key server1.key -out server1.csr -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=www.wt17.ephec-ti.be"
RUN openssl x509 -req -days 365 -in server1.csr -signkey server1.key -out server1.crt

RUN openssl genrsa -out server2.key 2048
RUN openssl req -new -key server2.key -out server2.csr -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=b2b.wt17.ephec-ti.be"
RUN openssl x509 -req -days 365 -in server2.csr -signkey server2.key -out server2.crt

RUN openssl genrsa -out server3.key 2048
RUN openssl req -new -key server3.key -out server3.csr -subj "/C=BE/ST=Belgium/L=Genappe/O=wt17k/OU=wt17/CN=intranet.wt17.ephec-ti.be"
RUN openssl x509 -req -days 365 -in server3.csr -signkey server3.key -out server3.crt

# Déclaration des variables d'environnement
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Exposer le port 443 à apache
EXPOSE 443
EXPOSE 80

# Injecter les fichiers au bon endroit
ADD www /var/www/site1
ADD b2b /var/www/site2
ADD intranet /var/www/site3

# remplacer la config de base par la nouvelle
ADD apache-config.conf /etc/apache2/sites-enabled/default-ssl.conf
run echo "listen 443" >> /etc/apache2/ports.conf

RUN a2ensite default-ssl
RUN service apache2 reload
# démarrer apache en tâche de fond
CMD /usr/sbin/apache2ctl -D FOREGROUND
