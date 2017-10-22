

------------
# Quickstart: Compose and WordPress
# https://docs.docker.com/compose/wordpress/
------------
mkdir php-wordpress-app
cd php-wordpress-app
$ vi docker-compose.yml
$ docker-compose up -d

## stop
$ docker-compose stop


------------
# How to create your Wordpress Repo from Original Repo
# currently 4.8.2 base
------------

# forke Original Repo
https://github.com/WordPress/WordPress    
# clone forked repo
$ git clone git@github.com:yokawasa/WordPress.git

# create Dockerfile and relevant files
## https://github.com/docker-library/wordpress/tree/master/php7.0/apache
$ cd Wordpress
$ add Dockerfile docker-entrypoint.sh

# create docker-compose.yml
$ vi docker-compose.yml

#  build
$ docker-compose build
$ docker-compose -f <file> build

#  start|up
$ docker-compose -f <file> up -d
#  stop|down
$ docker-compose -f <file> down
