# dcape-app-nginx-sample

[![GitHub Release][1]][2] [![GitHub code size in bytes][3]]() [![GitHub license][4]][5]

[1]: https://img.shields.io/github/release/dopos/dcape-app-nginx-sample.svg
[2]: https://github.com/dopos/dcape-app-nginx-sample/releases
[3]: https://img.shields.io/github/languages/code-size/dopos/dcape-app-nginx-sample.svg
[4]: https://img.shields.io/github/license/dopos/dcape-app-nginx-sample.svg
[5]: LICENSE

[NGINX](http://nginx.org/) sample application package for [dcape](https://github.com/dopos/dcape).

## Docker image used

* [nginx](https://hub.docker.com/_/nginx)

## Features

This project contains

* reference versions of core files for all of **dcape** applications since **dcape** v2:
  * [Makefile](Makefile)
  * [.drone.yml](.drone.yml)
  * [dcape-compose.yml](dcape-compose.yml)
* samples for some nginx features:
  * log real user's ip from traefik data
  * send gzipped static files
  * custom error pages

## Requirements

* linux 64bit (git, make, sed)
* [docker](http://docker.io)
* [dcape](https://github.com/dopos/dcape) v2
* Git service ([github](https://github.com), [gitea](https://gitea.io) or [gogs](https://gogs.io))

## Install

### By mouse (deploy with drone)

* Gitea: Fork or mirror this repo in your Git service
* Drone: Activate repo
* Gitea: "Test delivery", config sample will be saved to enfist
* Enfist: Edit config and remove .sample from name
* Gitea: "Test delivery" again (or Drone: "Restart") - app will be installed and started on webhook host

### By hands

```bash
git clone -b v2 --single-branch --depth 1 https://github.com/dopos/dcape-app-nginx-sample.git
cd dcape-app-nginx-sample
make config
... <edit .env.sample>
mv .env.sample .env
make up
```

## Upgrade

```bash
git pull
make config
... <check .env.sample>
mv .env.sample .env
make up
```

## License

The MIT License (MIT), see [LICENSE](LICENSE).

Copyright (c) 2017-2020 Alexey Kovrizhkin <lekovr+dopos@gmail.com>
