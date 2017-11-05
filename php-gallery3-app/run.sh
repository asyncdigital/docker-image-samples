#!/bin/sh

#docker run -v /Users/yoichika/dev/github.pub/kd_gallery3/src:/var/www -v /Users/yoichika/dev/docker/gallery3/gallery:/var/www/var/ --rm -p 8080:80 --hostname myhost.domaint -it gallery3:0.0.1 /bin/bash
docker run --rm -p 8080:80 --hostname myhost.domaint -it gallery3:0.0.1 /bin/bash

