#!/bin/sh

myAzureUser="http://yoichika-app"
#myAzurePass="<service principal password>"
#myAzureTenant="<service principal tenant name>"
myAzurePass="76effcab-4b99-4f0f-94e8-31433f5e4b54"
myAzureTenant="72f988bf-86f1-41af-91ab-2d7cd011db47"

myResourceGroup="RG-yoichika-demo"
myLocation="southeastasia"
mySKU="S1"                           #F1,FREE,D1,SHARED,B1,B2,B3,S1,S2,S3,P1,P2,P3
myAppServicePlan="appslinuxplan"
myAppName="yoichikarailsapp01"
myDockerCustomImage="yoichikawasaki/rails-nginx-mysql-app:0.0.1"

#az group create --name $myResourceGroup --location $myLocation
#az appservice plan create --name $myAppServicePlan --resource-group $myResourceGroup --sku $mySKU
az login --service-principal -u $myAzureUser -p $myAzurePass --tenant $myAzureTenant
az webapp create --name $myAppName --resource-group $myResourceGroup --plan $myAppServicePlan --deployment-container-image-name $myDockerCustomImage
