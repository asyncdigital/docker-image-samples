# gallery3-docker

It's a project to easyly install gallery3 with mysql thanks docker

----------


##Installation

* create a fig.yml:

```
mysqlgallery3:
  image: mysql:5.5 
  volumes:
    - /var/lib/mysql_gallery3/:/var/lib/mysql
  environment:
    - MYSQL_ROOT_PASSWORD: XXXX
    - MYSQL_DATABASE: gallery3
    - MYSQL_USER: gallery3
    - MYSQL_PASSWORD: XXXXXX
    
gallery3:
  image: mathieuruelan/gallery3
  ports:
    - "8889:80"
  links:
    - mysqlgallery3:mysql
  volumes:
    - /LOCALGALLERYPATH:/var/www/var/
    - /var/log
    - /var/log/gallery3:/var/log/apache2
  hostname: myhost
  domainname: mydomain.com

```


> MySQL environment variables are needed only the first at the first launch. For security, edit it after and remove passwords.
> the host and the domain must be set otherwise, the mod_rewrite checking doesn't work.

##Launch
```
fig up -d
```
