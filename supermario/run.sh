#!/bin/sh
# https://hub.docker.com/r/pengbai/docker-supermario/

docker run -d -p 8600:8080 pengbai/docker-supermario

open "http://localhost:8600"
