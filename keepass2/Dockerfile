FROM zburgermeiszter/usermode-alpine:3.3

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

USER root

RUN apk add mono xdotool libgdiplus --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && \
    apk add --no-cache ttf-dejavu && \
    ln /usr/lib/libgdiplus.so.0 /usr/lib/libgdiplus.so

USER user

RUN wget http://downloads.sourceforge.net/project/keepass/KeePass%202.x/2.32/KeePass-2.32.zip -O keepass.zip && \
    echo "b4aeb4ad09d62173e40720e18a35d8bc  keepass.zip" | md5sum -sc && \
    mkdir .keepass && \
    unzip keepass.zip -d .keepass && \
    rm keepass.zip

ENTRYPOINT ["/usr/bin/mono","/home/user/.keepass/KeePass.exe"]