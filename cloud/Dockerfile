FROM ubuntu:16.10
MAINTAINER t.scuflaire@students.ephec.be
RUN wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_16.10/Release.key -O Release.key
RUN apt-key add - < Release.key
RUN sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_16.10/ /' > /etc/apt/sources.list.d/owncloud.list"
RUN apt-get update
RUN apt-get install owncloud
