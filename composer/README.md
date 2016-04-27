# Docker PHP Composer image#

### Install Composer dependencies ###

```
docker run --rm -it -u 1000:1000 -v $(pwd):/app -v ~/.ssh:/home/user/.ssh zburgermeiszter/composer install
```

### Use it globally ###
If you want to use your docker image as the composer would be installed on your environment, you can simply set up an alias.

```
alias composer='docker run --rm -it -u 1000:1000 -v $(pwd):/app -v ~/.ssh:/home/user/.ssh zburgermeiszter/composer'
```

Then use it as a regular composer:
```
composer install
```
