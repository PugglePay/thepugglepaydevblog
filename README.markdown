# The Zimpler dev blog

Setup:

```
./setup.sh
```

## Run locally:

``` sh
docker-compose up preview
```

## New post:

```
docker-compose run --rm bash rake new_post["Title"]
```

use `<!-- more -->` to split the intro and the rest of the post (the "read more..." part).

## Deploy

``` sh
make deploy
```
