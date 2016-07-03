BitTorrent Sync for Raspberry Pi 2/3 on Alpine linux
====================================================

[Docker Hub](https://hub.docker.com/r/zburgermeiszter/btsync-alpine-armhf/)
[GitHub](https://github.com/zburgermeiszter/dockerfiles/tree/master/btsync-armhf)

Sync uses peer-to-peer technology to provide fast, private file sharing for teams and individuals. By skipping the cloud, transfers can be significantly faster because files take the shortest path between devices. Sync does not store your information on servers in the cloud, avoiding cloud privacy concerns.

# Usage

    docker run -d \
      -p 8888:8888 \
      -p 55555:55555 \
      -v /home/pi/sync:/mnt/sync \
      zburgermeiszter/btsync-alpine-armhf:2.3.7

# Volume

* /mnt/sync - State files and Sync folders

# Ports

* 8888 - Webui
* 55555 - Listening port for Sync traffic
