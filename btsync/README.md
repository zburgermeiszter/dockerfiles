BitTorrent Sync
===============
*Forked from [B-C/sync-docker](https://github.com/B-C/sync-docker)*

Sync uses peer-to-peer technology to provide fast, private file sharing for teams and individuals. By skipping the cloud, transfers can be significantly faster because files take the shortest path between devices. Sync does not store your information on servers in the cloud, avoiding cloud privacy concerns.

# Usage

    BTSYNC_FOLDER=/path/to/btsync/storage/folder/on/the/host
    WEBUI_PORT=[ port to access the webui on the host ]

    mkdir -p BTSYNC_FOLDER

    docker run -d \
      -p 127.0.0.1:$WEBUI_PORT:8888 -p 55555:55555 \
      -v $BTSYNC_FOLDER:/mnt/sync \
      zburgermeiszter/btsync

Go to localhost:$WEBUI_PORT in a web browser to access the webui.

# Volume

* /mnt/sync - State files and Sync folders

# Ports

* 8888 - Webui
* 55555 - Listening port for Sync traffic
