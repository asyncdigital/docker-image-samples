#!/bin/sh
set -e -x

RESOURCE_GROUP="RG-yoichika-demo"
NAME="mysleepapp01"

az webapp config appsettings set \
  -n $NAME \
  -g $RESOURCE_GROUP \
  --settings \
   MYPORT=5000 \
   MYSLEEPTIME=350 \
   WEBSITES_CONTAINER_START_TIME_LIMIT=230
