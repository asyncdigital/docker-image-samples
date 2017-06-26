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
version=`cat ./5.6-apache/VERSION`
tag="5.6-apache2-$version"
echo "tag=$tag"

docker build -t "$1"/php:$tag ./5.6-apache
docker login -u "$2" -p "$3"
docker push "$1"/php:$tag

docker logout
