#!/usr/bin/env bash
set -x -e

loginserver="yoichika.azurecr.io"
acruser="69ad3319-929a-4487-91df-f8b1a0e16e64"
acrpass="76effcab-4b99-4f0f-94e8-31433f5e4b54"

echo "loginserver=$loginserver"
echo "docker user=$acruser"
echo "docker passwd=$acrpass"

{
docker login $loginserver -u $acruser -p $acrpass
version=`cat ./VERSION`
tag="$version"
echo "tag=$tag"
docker build -t "$loginserver/rails-nginx-mysql-app:$tag" .
docker push "$loginserver/rails-nginx-mysql-app:$tag"
docker logout
} 2>&1 | tee build.log
