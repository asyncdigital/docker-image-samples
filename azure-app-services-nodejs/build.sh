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

version=`cat ./angular4-app/VERSION`
tag="angular4-app-$version"
echo "tag=$tag"
docker build -t "$1"/app-services-nodejs:$tag ./angular4-app
docker push "$1"/app-services-nodejs:$tag

version=`cat ./node8.12-app/VERSION`
tag="node8.12-app-$version"
echo "tag=$tag"
docker build -t "$1"/app-services-nodejs:$tag ./node8.12-app
docker push "$1"/app-services-nodejs:$tag

docker logout
