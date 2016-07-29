#!/bin/sh

CONFIG_FILE=${CONFIG_FILE:-/syncthing/.config/syncthing/config.xml}
APIKEY=${APIKEY:-$(cat $CONFIG_FILE | awk -F "[><]" '/apikey/{print $3}')}
PROTOCOL=$(grep -q "tls=\"true\"" $CONFIG_FILE && echo "https" || echo "http")
ST_HOST=${ST_HOST:-localhost}
ST_PORT=${ST_PORT:-8384}

while true
do
  syncthing-inotify -target="$PROTOCOL://$ST_HOST:$ST_PORT" -api=$APIKEY
  echo "Restarting syncthing-inotify";
done;