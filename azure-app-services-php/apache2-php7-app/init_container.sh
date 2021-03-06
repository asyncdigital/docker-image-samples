#!/bin/bash

sed -i "s/{PORT}/$PORT/g" /etc/apache2/apache2.conf

[ ! -d /var/lock/apache2 ] && mkdir /var/lock/apache2
[ ! -d /var/run/apache2 ] && mkdir /var/run/apache2
[ ! -d /var/log/apache2 ] && mkdir /var/log/apache2

/usr/sbin/apache2ctl -D FOREGROUND
