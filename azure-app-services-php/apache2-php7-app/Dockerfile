FROM php:7.0-apache
MAINTAINER Yoichi Kawasaki Github@yokawasa

RUN apt-get update && \
    apt-get install -y php5-mysql && \
    apt-get clean

COPY apache2.conf /bin/
COPY init_container.sh /bin/
COPY webapp /var/www/html/

RUN   \
   rm -f /var/log/apache2/* \
   && rmdir /var/lock/apache2 \
   && rmdir /var/run/apache2 \
   && rmdir /var/log/apache2 \
   && chmod 777 /var/log \
   && chmod 777 /var/run \
   && chmod 777 /var/lock \
   && chmod 777 /bin/init_container.sh \
   && cp /bin/apache2.conf /etc/apache2/apache2.conf


EXPOSE 8080

ENV PORT 8080

WORKDIR /var/www/html
ENTRYPOINT ["/bin/init_container.sh"]
