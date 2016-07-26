# CouldFlare Dynamic DNS updater in Docker [DDNS, DynDns]

## What is it?
This image periodically updates IP address (A record) in CloudFlare hosted DNS.
If docker is on a server with dynamic IP address it can be useful.
Using OpenDNS resolver to get the IP as it is more reliable than HTTP based resolvers.
Using CloudFlare v4 API to update records.

## Usage

Get your API key from your CloudFlare account page.

```
docker run -d \
  --restart=unless-stopped \
  -e CF_API_KEY=<CloudFlare API key> \
  -e CF_AUTH_EMAIL=<E-mail address you registered with on CloudFlare> \
  -e CF_ROOT_DOMAIN=yourdomain.com \
  -e CF_RECORD=hostname.yourdomain.com \
  -e UPDATE_INTERVAL=<IP re-check interval in seconds. Skip for one-time update> \
  zburgermeiszter/cloudflare-ddns:1.0
```