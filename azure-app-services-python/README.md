Docker image for Azure App Services Python
=======================
This image is Azure App Services Python Runtime stack or applications


## QuickStart
### Build and Push images to Docker Hub
simply run build.sh on top directory
```
./build.sh
```

### Run Python Flask app
```
docker run -it --rm -p 5000:5000 yoichikawasaki/app-services-python:simple-flask-app-0.1.0 python app.py
```

### Run Python Django app
```
docker run -it --rm -p 8080:8080 yoichikawasaki/app-services-python:django-app-0.1.0
```
