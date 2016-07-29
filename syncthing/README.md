# Syncthing

Syncthing replaces proprietary sync and cloud services with something open, trustworthy and decentralized. 
Your data is your data alone and you deserve to choose where it is stored, 
if it is shared with some third party and how it's transmitted over the Internet.

The system periodically check every registered folders for changed files which implies the synchronisation is NOT realtime.  
To resolve this concern you can use the `syncthing-inotify` extension which notifies Syncthing when a file has changed, 
which makes the synchronisation near realtime.

## Usage:

```
docker run \
        -d \
        --net=host \
        --name syncthing \
        -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
        -v $(pwd)/data:/syncthing \
        -v /etc/localtime:/etc/localtime:ro \
        -e GID=$(id -g) -e UID=$(id -u) \
        --restart=unless-stopped \
        zburgermeiszter/syncthing:0.14.3
        
docker run \
        -d \
        --net=host \
        --name syncthing-inotify \
        --volumes-from syncthing \
        -v /etc/localtime:/etc/localtime:ro \
        -e GID=$(id -g) -e UID=$(id -u) \
        --restart=unless-stopped \
        zburgermeiszter/syncthing-inotify:0.8.3
```

## Usage with docker-compose

Configure your data folder path and user and group IDs in the `.env` file.

```
docker-compose up
```

## Security

By default Syncthing is only accessible from localhost.
If you enable the access from everywhere for your peace of mind, enable the HTTPs in the settings.
Go to `Actions -> Settings` to configure these.

## Encryption

Syncthing encrypts the traffic between the nodes with TLS, however the data stored on the disk is not encrypted.  
It requires further work from the maintainers, or some third party tools can be used to create encrypted volumes,
then use them in Syncthing.