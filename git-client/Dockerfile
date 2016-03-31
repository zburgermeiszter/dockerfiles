FROM alpine:3.3

RUN apk add --no-cache openssh-client git

# Security fix for CVE-2016-0777 and CVE-2016-0778
RUN echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

RUN adduser -D -u 1000 user

WORKDIR "/git"
VOLUME ["/git"]

ENTRYPOINT ["git"]