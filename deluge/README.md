# Deluge BitTorrent client on Alpine Linux

For maximum security it is regenerating the password hash salt, the hashed password the SSL keys on every startup.

## Usage:
```
docker run -d \
  --restart=unless-stopped \
  --name=deluge \
  -p 8112:8112 \
  -p 58846:58846 \
  -p 58946:58946 \
  -p 58946:58946/udp \
  -v /etc/localtime:/etc/localtime:ro \
  -v $(pwd)/deluge:/deluge \
  -e PASSWORD=5up3R53cR37 \
  zburgermeiszter/deluge:1.3.12-rev2
```

## Volumes
/media : Downloaded content  
/config : Deluge config files  
/watch : .torrent file watch folder for auto-download

## Ports:
8112 : WebUI  
58846 : Deluge daemon listening port  
58946(/udp) : Incoming torrent connections port (tcp and udp) 