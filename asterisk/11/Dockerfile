FROM alpine:2.7

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

RUN apk update && \
    apk add asterisk

EXPOSE 5060

ENTRYPOINT ["asterisk"]
CMD ["-vvvvf"]