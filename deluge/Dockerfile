FROM alpine:3.4

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

RUN apk add deluge py-service_identity --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
    apk add --no-cache --update openssl

VOLUME /deluge
WORKDIR /deluge

ADD initial-config /initial-config

# expose port for http
EXPOSE 8112

# expose port for deluge daemon
EXPOSE 58846

# expose port for incoming torrent data (tcp and udp)
EXPOSE 58946
EXPOSE 58946/udp

ADD start.sh /sbin/start.sh
RUN chmod +x /sbin/start.sh

ADD my_init /sbin/my_init
RUN chmod +x /sbin/my_init
ENTRYPOINT ["/sbin/my_init"]

CMD ["/sbin/start.sh"]