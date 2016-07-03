FROM zburgermeiszter/glibc-alpine-armhf:2.22

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

LABEL com.getsync.version="2.3.7"

RUN apk --update --no-cache add tar curl && \
    curl -s -k -L "https://download-cdn.getsync.com/2.3.7/linux-armhf/BitTorrent-Sync_armhf.tar.gz" | tar -xzf - -C /usr/sbin btsync && \
    apk del tar curl && \
    rm -rf /var/cache/apk/*

COPY btsync.conf /etc/
COPY run_sync /opt/

ENV USERID 1000
ENV GROUPID 1000

VOLUME /mnt/sync

RUN chown -R 1000:1000 \
      /etc/btsync.conf \
      /mnt/sync \
      /opt/run_sync \
      /usr/sbin/btsync

EXPOSE 8888 55555 55555/udp

ENTRYPOINT ["/opt/run_sync"]
CMD ["--log", "--config", "/etc/btsync.conf"]
