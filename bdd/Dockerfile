FROM ubuntu:14.04
MAINTAINER t.scuflaire@students.ephec.be


#création des variables d'environnement
ENV MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/var/lib/mysql \
    MYSQL_LOG_DIR=/var/log/mysql

# installation des mods mysql nécessaires
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
 && rm -rf ${MYSQL_DATA_DIR} \
 && rm -rf /var/lib/apt/lists/*

# injecter entrypoint dans le container
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

# Lier mysql au port 3306
EXPOSE 3306/tcp


# Création d'un volume partagé entre host et le container
VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]

# Exécution
CMD ["/usr/bin/mysqld_safe"]
