#!/usr/bin/env bash
set -x -e

if [ $# -ne 2 ]
then
    echo "$0 [dockerhub account] [dockerhub password]"
    exit
fi
echo "docker account name=$1"
echo "docker account passwd=$2"

cwd=`dirname "$0"`
expr "$0" : "/.*" > /dev/null || cwd=`(cd "$cwd" && pwd)`

{
docker login -u "$1" -p "$2"
version=`cat $cwd/../VERSION`
tag="$version"
echo "tag=$tag"
docker tag php-fluentd-app:$tag "$1"/php-fluentd-app:$tag
docker push "$1"/php-fluentd-app:$tag
docker logout
} 2>&1 | tee push.log
