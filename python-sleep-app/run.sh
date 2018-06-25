#!/usr/bin/env bash
set -x -e

version=`cat ./VERSION`
tag="$version"

docker run --rm  -e MYPORT=5000 -e MYSLEEPTIME=10 -p 5000:5000 -it yoichikawasaki/sleepapp:$tag python app.py
