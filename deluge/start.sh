#!/bin/sh

CONFIG_PATH="/deluge/config"
CERT=$CONFIG_PATH/deluge.crt
KEY=$CONFIG_PATH/deluge.key

rm -f $CONFIG_PATH/deluged.pid

yes n | cp -i -R /initial-config/* $CONFIG_PATH 2>/dev/null

if [ ! -f $CERT ] || [ ! -f $KEY ]; then
  echo "Generating SSL certs..."
  openssl req -new -x509 -nodes -out $CERT -keyout $KEY -subj "/C=xx/ST=x/L=x/O=x/CN=x"
fi

PWD_SALT=`openssl rand -hex 32`
PWD_SHA1=`echo -n $PWD_SALT${PASSWORD-deluge} | sha1sum | awk '{print $1}'`

sed -i -e '/"pwd_salt":\ "/ s/:\ ".*"/:\ "'"$PWD_SALT"'"/g' $CONFIG_PATH/web.conf
sed -i -e '/"pwd_sha1":\ "/ s/:\ ".*"/:\ "'"$PWD_SHA1"'"/g' $CONFIG_PATH/web.conf

sed -i -e '/"pkey":\ "/ s|:\ ".*"|:\ "'"$KEY"'"|g' $CONFIG_PATH/web.conf
sed -i -e '/"cert":\ "/ s|:\ ".*"|:\ "'"$CERT"'"|g' $CONFIG_PATH/web.conf

#ln -sf /dev/stdout /config/deluge/deluged.log && \
deluged -c $CONFIG_PATH -L info && \
deluge-web -c $CONFIG_PATH