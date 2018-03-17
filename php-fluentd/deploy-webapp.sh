#!/bin/sh
set -x -e

cwd=`dirname "$0"`
expr "$0" : "/.*" > /dev/null || cwd=`(cd "$cwd" && pwd)`

RESOURCE_GROUP="RG-yoichika-demo"
NAME="yoichikaphpfluentd"
APP_SERVICE_PLAN=appslinuxplan
#CONTAINER_IMAGE=<REGISTRY_URL>/<CONTAINER_IMAGE:TAG>
CONTAINER_IMAGE=yoichikawasaki/php-fluentd-app:0.0.1

## Create 
# az group create --name $RESOURCE_GROUP --location japanwest

## Create App Service Plan (If it's App Service Plan instead of Consumption Plan)
# az appservice plan create \
#  --name $APP_SERVICE_PLAN \
#  --resource-group $RESOURCE_GROUP \
#  --sku S1 --is-linux
### [NOTE] Plan with Linux worker can only be created in a group which has never contained a Windows worker, and vice versa.

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
    ELASTICSEARCH_HOST=40.74.124.30 \
    WEBSITES_ENABLE_APP_SERVICE_STORAGE="true"
