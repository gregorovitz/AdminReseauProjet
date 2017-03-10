FROM ubuntu:latest
MAINTAINER Emmanuel Marquebreucq <e.marquebreucq@students.ephec.be>

ENV DATA_DIR=/data/bind

# Install bind
RUN apt-get update \
 && apt-get install -y bind9 dnsutils \
 && rm -rf /var/lib/apt/lists/*

ADD start /start
RUN chmod 755 /start


# Expose dns 
EXPOSE 53/udp 53/tcp 
VOLUME ["${DATA_DIR}"]
CMD ["/start"]

# Copy this repo into place.
ADD named.conf.local /etc/bind/named.conf.local
ADD db.wt17.ephec-ti.be.hosts /var/lib/bind/db.wt17.ephec-ti.be.hosts

