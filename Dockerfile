FROM ubuntu:14.10

RUN locale-gen en_US en_US.UTF-8

RUN apt-get -qq update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget avahi-daemon avahi-utils

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400

ENV PLEX_VERSION 1.11.3.4803-c40bba82e
RUN wget http://downloads.plexapp.com/plex-media-server/${PLEX_VERSION}/plexmediaserver_${PLEX_VERSION}_amd64.deb
RUN dpkg -i plexmediaserver_${PLEX_VERSION}_amd64.deb

ENTRYPOINT ["/start.sh"]

