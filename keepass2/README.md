# Keepass2 in Docker based on Alpine Linux 3.3

To run it locally:  
*Before running it make sure the mounted `keepass` folder exists.*  
```
sudo docker run --rm -it \
--net=none \
-v ~/.Xauthority:/root/.Xauthority \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/keepass:/home/user/keepass \
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
-v $HOME/keepass:/home/user/keepass \
-e DISPLAY=unix$DISPLAY \
zburgermeiszter/keepass2
```

### Usage in desktop environment

**Important:** You need to install  `xterm` (`sudo apt-get install xterm`) on your host to use these features. 

Copy the `desktop/KeePass.desktop` file to your `/usr/share/applications` folder.  
To provide the correct graphics for the launcher icon copy the `desktop/keepass2.png`

### Auto-type  
[Add your user to `docker` group](https://docs.docker.com/engine/installation/linux/ubuntulinux/#create-a-docker-group) to avoid issues with `sudo` password prompt.  
Configure a global hotkey in your system with the following command.  
```
xterm -e "docker exec -it $(docker ps | grep keepass2 | awk '{print $1}') /usr/bin/mono /home/user/.keepass/KeePass.exe -auto-type"
```  
The default KeePass auto-type hotkey is `Ctrl + Alt + A`.

**Global hotkey setup:**  
  - [Ubuntu](https://wiki.ubuntu.com/Keybindings), [Ubuntu 2](http://www.howtogeek.com/howto/ubuntu/assign-custom-shortcut-keys-on-ubuntu-linux/)  
  - [ElementaryOS](http://blog.elementary.io/post/119612714681/custom-keyboard-shortcuts-are-here)
  
### Custom configuration  
To customize the startup of KeePass use the `KeePass.config.xml` file from this repository and mount it to your
 container:  
```-v $(pwd)/KeePass.config.xml:/home/user/.keepass/KeePass.config.xml```

# Frequent issues
`'Gtk: cannot open display: :0'`  
Try to run the following: `xhost +` or `export DISPLAY=your_host_ip:0`  
(see: [http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0](http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0))

