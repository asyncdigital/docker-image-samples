#!/usr/bin/env bash
set -x -e

version=`cat ./VERSION`
tag="$version"

docker run --rm  -e MYVERSION_PORT=5000 -p 5000:5000 -it yoichikawasaki/myversion:$tag python app.py
