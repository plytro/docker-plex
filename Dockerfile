FROM ubuntu:14.04

RUN locale-gen en_US en_US.UTF-8

RUN apt-get -qq update
RUN apt-get -qqy --force-yes dist-upgrade
RUN apt-get install -qqy --force-yes wget avahi-daemon avahi-utils

RUN wget http://downloads.plexapp.com/plex-media-server/0.9.9.7.429-f80a8d6/plexmediaserver_0.9.9.7.429-f80a8d6_amd64.deb
RUN dpkg -i plexmediaserver_0.9.9.7.429-f80a8d6_amd64.deb

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 32400

ENTRYPOINT ["/start.sh"]

