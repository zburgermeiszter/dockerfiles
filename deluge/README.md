# Deluge BitTorrent client on Alpine Linux

For maximum security it is regenerating the password hash salt, the hashed password the SSL keys on every startup.

## Usage:
```
docker run -it --rm \
-p 8112:8112 \
-p 58846:58846 \
-p 58946:58946 \
-p 58946:58946/udp \ 
-v $PWD/media:/media \
-e PASSWORD=5up3R53cR37 \
zburgermeiszter/deluge:1.3.12
```

## Volumes
/media : Downloaded content  
/config : Deluge config files  
/watch : .torrent file watch folder for auto-download

## Ports:
8112 : WebUI  
58846 : Deluge daemon listening port  
58946(/udp) : Incoming torrent connections port (tcp and udp) 