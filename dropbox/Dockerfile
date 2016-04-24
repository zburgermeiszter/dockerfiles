FROM zburgermeiszter/usermode:alpine-3.3_glibc-2.23

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

USER root

RUN apk add --no-cache ca-certificates

USER user

RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

WORKDIR /home/user/.dropbox-dist/