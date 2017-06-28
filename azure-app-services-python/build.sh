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

version=`cat ./simple-flask-app/VERSION`
tag="simple-flask-app-$version"
echo "tag=$tag"
docker build -t "$1"/app-services-python:$tag ./simple-flask-app
docker push "$1"/app-services-python:$tag

docker logout
