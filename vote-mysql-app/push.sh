#!/usr/bin/env bash
set -x -e

if [ $# -ne 2 ]
then
    echo "$0 [dockerhub account] [dockerhub password]"
    exit
fi
echo "docker account name=$1"
echo "docker account passwd=$2"

docker login -u "$1" -p "$2"

version="v1"
tag="$version"
echo "tag=$tag"
docker build -t "$1"/azure-vote-front:$tag ./azure-vote
docker push "$1"/azure-vote-front:$tag

docker build -t "$1"/azure-vote-back:$tag ./azure-vote-mysql
docker push "$1"/azure-vote-back:$tag

docker logout

