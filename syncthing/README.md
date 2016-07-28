# Syncthing

## Usage:
```
docker run \
        -d \
        --net=host \
        -v </path/to/syncthing/on/host>:/syncthing \
        -e GID=$(id -g) \
        -e UID=$(id -u) \
        syncthing
```