#!/bin/sh

cwd=`dirname "$0"`
expr "$0" : "/.*" > /dev/null || cwd=`(cd "$cwd" && pwd)`
#. $cwd/../../scripts/videoanalytics.conf

version=`cat $cwd/../VERSION`
tag="$version"
docker run --rm \
    -e ELASTICSEARCH_HOST=40.74.124.30 \
    -p 8080:8080 -p 2222:2222 -it php-fluentd-app:$tag
