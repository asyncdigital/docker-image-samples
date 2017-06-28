#!/usr/bin/env bash
set -x -e

if [ $# -ne 3 ]
then
    echo "$0 [username] [dockerhub account] [dockerhub password]"
    exit
fi
echo "username=$1"
echo "docker account name=$2"
echo "docker account passwd=$3"

docker login -u "$2" -p "$3"

version=`cat ./apache2-php5.6-app/VERSION`
tag="apache2-php5.6-app-$version"
echo "tag=$tag"
docker build -t "$1"/app-services-php:$tag ./apache2-php5.6-app
docker push "$1"/app-services-php:$tag

version=`cat ./apache2-php7-app/VERSION`
tag="apache2-php7-app-$version"
echo "tag=$tag"
docker build -t "$1"/app-services-php:$tag ./apache2-php7-app
docker push "$1"/app-services-php:$tag

docker logout
