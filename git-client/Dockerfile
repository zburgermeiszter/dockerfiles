FROM zburgermeiszter/usermode-alpine:3.3

MAINTAINER Zoltan Burgermeiszter <zoltan@burgermeiszter.com>

USER root

RUN apk add --no-cache openssh-client git

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

USER user

WORKDIR /home/user/git

VOLUME ["/home/user/git"]

ENTRYPOINT ["git"]