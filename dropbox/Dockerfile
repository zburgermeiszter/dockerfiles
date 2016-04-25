FROM zburgermeiszter/usermode:alpine-3.3_glibc-2.23

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

USER root

RUN apk add --no-cache ca-certificates python \
    && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/bin/dropbox-cli \
    && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - \
    && mkdir -p /home/user/.dropbox /home/user/Dropbox \
    && chmod +x /usr/local/bin/dropbox-cli \
    && chown user:user /usr/local/bin/dropbox-cli \
    && chown user:user /home/user/.dropbox-dist \
    && chown user:user /home/user/.dropbox \
    && chown user:user /home/user/Dropbox

USER user

WORKDIR /home/user

EXPOSE 17500

VOLUME ["/home/user/Dropbox", "/home/user/.dropbox"]

CMD ["/home/user/.dropbox-dist/dropboxd"]