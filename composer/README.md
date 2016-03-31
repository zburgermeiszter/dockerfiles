# Docker PHP Composer image#

### Build ###
```
docker build -t=composer composer
```


### Install Composer dependencies ###
```
docker run --rm -u 1000:1000 -v $(pwd):/app composer install
```

or run without building

```
docker run --rm -u 1000:1000 -v $(pwd):/app zburgermeiszter/composer install
```

### Use it globally ###
If you want to use your docker image as the composer would be installed on your environment, you can simply set up an alias.

```
alias composer='docker run --rm -u 1000:1000 -v $(pwd):/app zburgermeiszter/composer'
```

Then use it as a regular composer:
```
composer install
```
