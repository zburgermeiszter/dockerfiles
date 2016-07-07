#!/bin/sh

chown user:user -R /config /media /watch

rm -f /config/deluge/deluged.pid
openssl req -new -x509 -nodes -out /home/user/deluge.crt -keyout /home/user/deluge.key -subj "/C=xx/ST=x/L=x/O=x/CN=x"

PWD_SALT=`openssl rand -hex 32`
PWD_SHA1=`echo -n $PWD_SALT${PASSWORD-deluge} | sha1sum | awk '{print $1}'`
echo $PWD_SALT$PASSWORD
sed -i -e '/"pwd_salt":\ "/ s/:\ ".*"/:\ "'"$PWD_SALT"'"/g' /config/deluge/web.conf
sed -i -e '/"pwd_sha1":\ "/ s/:\ ".*"/:\ "'"$PWD_SHA1"'"/g' /config/deluge/web.conf

su user -c " \
  deluged -c /config/deluge -L info && \
  ln -sf /dev/stdout /config/deluge/deluged.log && \
  deluge-web -c /config/deluge \
"