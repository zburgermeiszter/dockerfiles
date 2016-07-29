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

Configure your Syncthing folder path in `docker-compose.yml` file and user and group IDs in the `.env` file.

```
docker-compose up -d
```

## Usage with Raspberry Pi 3

To use this package on Raspberry Pi 3, the image names need to be suffixed with `-rpi3`.  
Replace `zburgermeiszter/syncthing:0.14.3` with `zburgermeiszter/syncthing:0.14.3-rpi3` and  
`zburgermeiszter/syncthing-inotify:0.8.3` with `zburgermeiszter/syncthing-inotify:0.8.3-rpi3`  
in your `docker-compose.rpi3.yml` file or in the `docker run` commands.

To start the package with `docker-compose` on Raspberry Pi 3 use the following command:  
```
docker-compose -f docker-compose.rpi3.yml -d up
```

## Configuration

For first run, it will generate a default configuration.  
By default Syncthing is available only from `localhost`. 


## Security

By default Syncthing is only accessible from localhost.
If you enable the access from everywhere it is strongly advised to set up a username and password and HTTPS in the  
`Actions -> Settings` screen.

If you run it on a remote server, and can not access to the web interface  
you need to replace the `address` value to `0.0.0.0:8384` in the `gui` section in the `config.xml` file.  
Then restart syncthing.

For further configuration, please visit the official [Syncthing documentation](https://docs.syncthing.net/).

## Encryption

Syncthing encrypts the traffic between the nodes with TLS, however the data stored on the disk is not encrypted.  
It requires further work from the maintainers, or some third party tools can be used to create encrypted volumes,
then use them in Syncthing.