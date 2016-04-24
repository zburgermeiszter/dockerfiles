FROM frolvlad/alpine-glibc:alpine-3.3_glibc-2.23

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

RUN addgroup -g 1000 user && \
    adduser -D -u 1000 -G user user

USER user

WORKDIR "/home/user"

ENTRYPOINT ["/bin/sh"]