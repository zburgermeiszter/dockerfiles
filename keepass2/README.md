# Keepass2 in Docker based on Alpine Linux 3.3 #

To run it locally:  
```
sudo docker run --rm -it \  
--net=none \
-v ~/.Xauthority:/root/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/keepass/zoltan.kdbx:/home/user/keepass.kdbx \
-v $HOME/keepass/zoltan.key:/home/user/keepass.key \
-e DISPLAY=unix$DISPLAY \
zburgermeiszter/keepass2
```

To run it on a remote docker host:  
```
ssh -XCt user@host \
sudo docker run --rm -it \
--net=none \
-v ~/.Xauthority:/root/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/keepass/keepass.kdbx:/home/user/keepass.kdbx \
-v $HOME/keepass/keepass.key:/home/user/keepass.key \
-e DISPLAY=unix$DISPLAY \
zburgermeiszter/keepass2
```

# Frequent issues #	
`# 'Gtk: cannot open display: :0'`  
Try to run the following: `xhost +` or `export DISPLAY=your_host_ip:0`  
(see: [http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0](http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0))
