FROM ubuntu:latest
MAINTAINER Emmanuel Marquebreucq <e.marquebreucq@students.ephec.be>

#initialisation des variable d'environnement
ENV DATA_DIR=/data/bind

# instalation de bind
RUN apt-get update \
 && apt-get install -y bind9 dnsutils \
 && rm -rf /var/lib/apt/lists/*

#ajout du fichier de lancement du service bind
ADD start /start
RUN chmod 755 /start

# ajout du fichier de zone dns
ADD named.conf.local /etc/bind/named.conf.local
ADD db.wt17.ephec-ti.be.hosts /var/lib/bind/wt17.ephec-ti.be
ADD named.conf.options /etc/bind/named.conf.options
Run  chmod  755 /var/lib/bind/wt17.ephec-ti.be

# Expose dns 
EXPOSE 53/udp 53/tcp 
VOLUME ["${DATA_DIR}"]

#exécution du fichier de lancement
CMD ["/start"]



