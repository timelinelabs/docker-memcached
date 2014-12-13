# Docker - Memcached

A minimal debian based [Docker](http://www.docker.com) container with [Memcached](http://memcached.org/) installed

There are a million and ten of these and this is mine!

## Usage

```
$ docker run repo/memcached

OR

$ docker run -e CACHE_SIZE=256 -e LOG_LEVEL=3 -e EXTRA_OPTS='-I 4m -t 10' repo/memcached
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `CACHE_SIZE` | 64 | Memcached cache size |
| `EXTRA_OPTS` | | Extra command line options to pass to memcached. See the memcached [man page](http://linux.die.net/man/1/memcached) for more details |
| `LOG_LEVEL` | 1 | Verbosity level. 0=none, 1=print errors/warnings, 2=also print client activity, 3=also print internal state info |
| `PORT` | 11211 | Listen port |