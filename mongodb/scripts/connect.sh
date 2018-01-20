#!/bin/sh

docker run -it --link my-mongo:mongo --rm mongo sh -c 'exec echo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'
