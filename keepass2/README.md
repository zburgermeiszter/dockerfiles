# Keepass2 in Docker based on Alpine Linux 3.3

To run it locally:  
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

### Auto-type  
[Add your user to `docker` group](https://docs.docker.com/engine/installation/linux/ubuntulinux/#create-a-docker-group) to avoid issues with `sudo` password prompt.  
Install `xterm` (`sudo apt-get install xterm`), then configure a global hotkey in your system with the following command.  
```
xterm -e "docker exec -it keepass2 /usr/bin/mono /home/user/.keepass/KeePass.exe -auto-type"
```  
The default KeePass auto-type hotkey is `Ctrl + Alt + A`.

**Global hotkey setup:**  
  - [Ubuntu](https://wiki.ubuntu.com/Keybindings), [Ubuntu 2](http://www.howtogeek.com/howto/ubuntu/assign-custom-shortcut-keys-on-ubuntu-linux/)  
  - [ElementaryOS](http://blog.elementary.io/post/119612714681/custom-keyboard-shortcuts-are-here)

# Frequent issues
`'Gtk: cannot open display: :0'`  
Try to run the following: `xhost +` or `export DISPLAY=your_host_ip:0`  
(see: [http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0](http://stackoverflow.com/questions/28392949/running-chromium-inside-docker-gtk-cannot-open-display-0))

