#!/bin/sh
set -x -e

RESOURCE_GROUP="RG-yoichika-demo"
NAME="mysleepapp01"
APP_SERVICE_PLAN="appslinuxplan"
CONTAINER_IMAGE="yoichikawasaki/sleepapp:0.1"

# Create Web App for Container
az webapp create \
  --name $NAME \
  --resource-group $RESOURCE_GROUP \
  --plan $APP_SERVICE_PLAN \
  --deployment-container-image-name $CONTAINER_IMAGE

## Configure App Settings
az webapp config appsettings set \
  -n $NAME \
  -g $RESOURCE_GROUP \
  --settings \
    MYPORT=5000 \
    MYSLEEPTIME=250
