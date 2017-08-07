# Django, uWSGI and Nginx in a container, using Supervisord

### Build and run
#### Build with python (Version 3)
* `docker build -t django-uwsgi-nginx-app .`
* `docker run -d -p 8080:8080 django-uwsgi-nginx-app`
*  curl localhost:8080

### How to insert your application

In /app currently a django project is created with startproject. You will
probably want to replace the content of /app with the root of your django
project. Then also remove the line of django-app startproject from the 
Dockerfile

uWSGI chdirs to /app so in uwsgi.ini you will need to make sure the python path
to the wsgi.py file is relative to that.
