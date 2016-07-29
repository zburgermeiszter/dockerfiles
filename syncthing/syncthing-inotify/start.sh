#!/bin/sh

CONFIG_FILE=${CONFIG_FILE:-/syncthing/.config/syncthing/config.xml}

TIMEOUT=1
while [ ! -f $CONFIG_FILE ]
do
  echo "Config file ($CONFIG_FILE) not found. Is it the first start? Retrying in $TIMEOUT sec(s)."
  sleep $TIMEOUT
  TIMEOUT=$(( TIMEOUT * 2 ))
done

echo "Config file ($CONFIG_FILE) found. Reading..."

APIKEY=${APIKEY:-$(cat $CONFIG_FILE | awk -F "[><]" '/apikey/{print $3}')}
PROTOCOL=$(grep -q "tls=\"true\"" $CONFIG_FILE && echo "https" || echo "http")
ST_HOST=${ST_HOST:-localhost}
ST_PORT=${ST_PORT:-8384}

while true
do
  syncthing-inotify -target="$PROTOCOL://$ST_HOST:$ST_PORT" -api=$APIKEY
  echo "Restarting syncthing-inotify";
done;