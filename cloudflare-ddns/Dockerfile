FROM alpine:3.4

ADD update-ip.sh /

RUN chmod +x /update-ip.sh

RUN apk add --update --no-cache jq curl

CMD ["./update-ip.sh"]