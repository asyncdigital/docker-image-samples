# Docker image for Azure App Services Node.js
=======================
This image is Azure App Services Node.js Runtime stack and Node.js application

## QuickStart
### Build and Push images to Docker Hub
simply run build.sh on top directory
```
./build.sh
```

### Run Node-8.12 app
```
docker run -it --rm -p 8080:8080 -p 2222:2222 yoichikawasaki/app-services-nodejs:node8.12-app-0.0.1
```

### Run Angular4 app
```
docker run -it --rm -p 4200:4200 -p 2222:2222 yoichikawasaki/app-services-nodejs:angular4-app-0.0.1
```


