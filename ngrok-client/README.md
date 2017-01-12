A [Docker][docker] image for [ngrok][ngrok] v2, introspected tunnels to localhost.
It's based on the excellent work of [wernight/docker-ngrok][wernight/docker-ngrok].


## Features

  * **Small**: Built using [alpine][alpine].
  * **Simple**: Simply link the webserver container. See examples below.
  * **Secure**: Runs as non-root user.


## Configuration

To see command-line options, run `docker run --rm zburgermeiszter/ngrok-client --help`.


## Usage

Supposing you've an Apache or Nginx Docker container named `web_service_container` listening on port 80:

    $ docker run --rm -it --link web_service_container --name ngrok zburgermeiszter/ngrok-client http web_service_container:80

### Environment variables

*Please consider using directly the command-line arguments of Ngrok.*

If you use the default `CMD` (i.e. don't specify the ngrok command-line but only `zburgermeiszter/ngrok-client`),
then you can use instead envrionment variables magic below.

You can specify one of several environment variable (via `-e`) to configure your Ngrok tunnel:

  * `NGROK_AUTH` - Authentication key for your Ngrok account. This is needed for custom subdomains, custom domains, and HTTP authentication.
  * `NGROK_SUBDOMAIN` - Name of the custom subdomain to use for your tunnel. You must also provide the authentication token.
  * `NGROK_DOMAIN` - Paying Ngrok customers can specify a custom domain. Only one subdomain or domain can be specified, with the domain taking priority.
  * `NGROK_USERNAME` - Username to use for HTTP authentication on the tunnel. You must also specify an authentication token.
  * `NGROK_PASSWORD` - Password to use for HTTP authentication on the tunnel. You must also specify an authentication token.
  * `NGROK_PROTOCOL` - Can either be `HTTP` or `TCP`, and it defaults to `HTTP` if not specified. If set to `TCP`, Ngrok will allocate a port instead of a subdomain and proxy TCP requests directly to your application.
  * `NGROK_PORT` - Port to expose (defaults to `80` for `HTTP` protocol).
  * `NGROK_REGION` - Region (`us` - United States (Dallas), `eu` - Europe (Frankfurt), `ap` - Asia/Pacific (Singapore), `au` - Australia (Sydney))                             
  * `NGROK_LOG` - Log location (`stdout`)                             
  * `NGROK_LOG_LEVEL` - Log level (`debug`,`info`)

#### Full example

 1. We'll set up a simple example HTTP server in a docker container named `server`:
        
        $ docker run -d --name server python:3 python -m http.server

 2. Now we'll link that HTTP server into an ngrok container to expose it on the internet:

        $ docker run -d --link server --name ngrok -e NGROK_PORT="server:8000" zburgermeiszter/ngrok-client

 3. You can now access the [API][ngrok-api] to find the assigned domain
    
        $ docker exec -t ngrok /bin/sh -c "curl -s localhost:4040/api/tunnels | jq '.tunnels[].public_url'"
    
### Helper

For common cases you may want to create an alias in your `~/.profile` (or `~/.bashrc`, `~/.zshrc`, or equivalent):

    function docker-ngrok() {
      docker run --rm -it --link "$1":http zburgermeiszter/ngrok-client http http:80
    }
    # For ZSH with Oh-My-Zsh! and 'docker' plugin enabled, you can also enable auto-completion:
    #compdef __docker_containers docker-ngrok

Then to the simple example just do `docker-ngrok web_service_container`.



## Feedbacks

Report issues/questions/feature requests on [GitHub Issues][issues].

Pull requests are very welcome!

[issues]:           https://github.com/zburgermeiszter/dockerfiles/issues
[docker]:           https://www.docker.io/
[alpine]:           https://hub.docker.com/_/alpine/
[ngrok]:            https://ngrok.com/
[ngrok-api]:        https://ngrok.com/docs#client-api
[wernight/docker-ngrok]: https://hub.docker.com/r/wernight/ngrok/
