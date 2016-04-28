# Dropbox in Docker

**Based on Alpine linux for minimal size.  
It's less than half size of any traditional Debian or Ubuntu based Dropbox image.**

Run Dropbox inside Docker. Fully working with local host folder mount or inter-container linking (via `--volumes-from`).

This repository provides the [zburgermeiszter/dropbox](https://registry.hub.docker.com/u/zburgermeiszter/dropbox/) image.

## Usage examples

### Quickstart

    docker run -d --restart=always --name=dropbox zburgermeiszter/dropbox

### Dropbox data mounted to local folder on the host

    docker run -d --restart=always --name=dropbox \
    -v /path/to/dropbox/data:/home/user/Dropbox \
    zburgermeiszter/dropbox
    
### Keep Dropbox data and settings on a host folder
This way there's no need to reauthorize the container with Dropbox account, and it's possible to run multiple Dropbox instances simply by changing name and the path to dropbox settings.

    docker run -d --restart=always --name=dropbox \
    -v /path/to/dropbox/data:/home/user/Dropbox \
    -v /path/to/dropbox/settings:/home/user/.dropbox \
    zburgermeiszter/dropbox

### Use the host timezone in the container
	
    docker run -d --restart=always --name=dropbox \
    -v /etc/localtime:/etc/localtime:ro \
    zburgermeiszter/dropbox

### Enable LAN Sync

    docker run -d --restart=always --name=dropbox \
    -p 17500:17500 \
    zburgermeiszter/dropbox

## Linking to Dropbox account after first start

Check the logs of the container to get URL to authenticate with your Dropbox account.

    docker logs dropbox

Copy and paste the URL in a browser and login to your Dropbox account to associate the container with your Dropbox account.

Running the previous command again after a few seconds, you should see something like this:

> "This computer is now linked to Dropbox. Welcome xxxx"

Now your container is syncing your Dropbox.

## Managing Dropbox sync via `dropbox-cli` tool.
	
    docker exec -it $(docker ps -f name=dropbox -q | awk 'NR==1{print $1}') dropbox-cli help
    
Make sure to use the exact name of the container otherwise running containers with similar names like `dropbox` and `dropbox2` gives arbitrary result when using `dropbox` in the filer.

More info about `dropbox-cli`: [Dropbox Wiki](http://www.dropboxwiki.com/tips-and-tricks/using-the-official-dropbox-command-line-interface-cli)

## Manage exclusions and check sync status

    docker exec -ti dropbox dropbox\ help

## Exposed volumes

`/home/user/Dropbox`
Dropbox files

`/home/user/.dropbox`
Dropbox account configuration

## Credits
This `README` is based on Jan B's [janeczku/docker-dropbox](https://github.com/janeczku/docker-dropbox) repository readme.