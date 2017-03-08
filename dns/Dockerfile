FROM ubuntu:latest
MAINTAINER Emmanuel Marquebreucq <e.marquebreucq@students.ephec.be>

ENV 
    DATA_DIR=/data

# Install bind
RUN apt-get update \
 && apt-get install -y bind9 dnsutils \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh


# Expose dns 
EXPOSE 53/udp 53/tcp 
VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]

# Copy this repo into place.
ADD named.conf.local /etc/bind/named.conf.local
ADD db.wt17.ephec-ti.be /var/lib/bind/wt17.ephec-ti.be
