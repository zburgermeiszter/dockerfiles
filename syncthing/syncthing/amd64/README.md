# Syncthing

TODO: write description about usage with or without inotify. 

## Usage:

```
docker-compose up
```

```
docker run \
        -d \
        -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
        -v </path/to/syncthing/on/host>:/syncthing \
        -v /etc/localtime:/etc/localtime:ro
        -e GID=$(id -g) -e UID=$(id -u) \
        --restart=unless-stopped
        syncthing
```