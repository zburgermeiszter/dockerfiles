FROM alpine:3.4

RUN apk add --update --no-cache samba samba-common-tools

ADD smb.conf /etc/samba/smb.conf

EXPOSE 137 139 445

CMD echo -ne "${PASS:-root}\n${PASS:-root}\n" | smbpasswd -a -s root && smbd -FS
