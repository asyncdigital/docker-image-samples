#!/bin/sh

# https://docs.microsoft.com/en-us/cli/azure/webapp/config/container#set
# az webapp config container set --name
#                               --resource-group
#                               [--docker-custom-image-name|-c]
#                               [--docker-registry-server-password|-p]
#                               [--docker-registry-server-url|-r]
#                               [--docker-registry-server-user|-u]
#                               [--slot|-s]

# Private registory
# https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/app-service/containers/app-service-linux-cli.md

myAzureUser="http://yoichika-app"
myAzurePass="<service principal password>"
myAzureTenant="<service principal tenant name>"

myResourceGroup="RG-yoichika-demo"
myAppName="yoichikarailsapp01"
myDockerCustomImage="yoichika.azurecr.io/rails-nginx-mysql-app:0.1.4"

az login --service-principal -u $myAzureUser -p $myAzurePass --tenant $myAzureTenant

## PRIVATE REGISTORY
## You can configure your app to use images from a private registry. You need to provide the url for your registry, user name, and password. This can be achieved using the following command:
## az webapp config container set -n sname1 -g rgname -c <container name> -r <server url> -u <username> -p <password>
myRegistryServerUrl="yoichika.azurecr.io"
myRegistryUserName="69ad3319-929a-4487-91df-f8b1a0e16e64"
myRegistryUserPass=$myAzurePass
az webapp config container set -n $myAppName -g $myResourceGroup -c $myDockerCustomImage -r $myRegistryServerUrl -u $myRegistryUserName -p $myRegistryUserPass
