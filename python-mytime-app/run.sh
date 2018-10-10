#!/usr/bin/env bash
set -x -e

version=`cat ./VERSION`
tag="$version"

docker run --rm  -e MYPORT=5000 -p 5000:5000 -it yoichikawasaki/mytime:$tag python app.py
