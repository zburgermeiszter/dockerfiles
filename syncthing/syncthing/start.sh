#!/bin/sh

CONFIG_PATH=$HOME/.config/syncthing
CONFIG_FILE=$CONFIG_PATH/config.xml

setup() {
  syncthing -generate=$CONFIG_PATH
  #sed -i 's/127.0.0.1/0.0.0.0/g' $CONFIG_FILE
}

if [ ! -f $CONFIG_FILE ]; then
    echo "Config not found! Generating..."
    setup
fi

syncthing -no-browser