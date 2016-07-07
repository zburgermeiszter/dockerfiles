FROM zburgermeiszter/usermode:alpine-3.4

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

USER root

RUN apk add deluge py-service_identity --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
    apk add --no-cache --update openssl

# mkdir -p /usr/share/GeoIP && \
# curl -s -k -L --compressed "http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz" > /usr/share/GeoIP/GeoIP.dat

VOLUME /config
VOLUME /media
VOLUME /watch

ADD config /config/deluge
ADD start.sh /start.sh

RUN chown user:user /start.sh && chmod +x /start.sh

# expose port for http
EXPOSE 8112

# expose port for deluge daemon
EXPOSE 58846

# expose port for incoming torrent data (tcp and udp)
EXPOSE 58946
EXPOSE 58946/udp

CMD /start.sh