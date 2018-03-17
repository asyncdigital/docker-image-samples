#!/bin/bash

# Set variables
sed -i "s/error.log/error_$WEBSITE_ROLE_INSTANCE_ID.log/g" /etc/apache2/apache2.conf
sed -i "s/access.log/access_$WEBSITE_ROLE_INSTANCE_ID.log/g" /etc/apache2/apache2.conf
sed -i "s/{PORT}/$PORT/g" /etc/apache2/apache2.conf
sed -i "s/{ELASTICSEARCH_HOST}/$ELASTICSEARCH_HOST/g" /etc/td-agent/td-agent.conf

# Start td-agent
[ ! -d /home/LogFiles/td-agent ] && mkdir -p /home/LogFiles/td-agent
chmod 777 /home/LogFiles/td-agent
[ ! -d /var/log/td-agent ] && ln -s /home/LogFiles/td-agent /var/log/td-agent
/etc/init.d/td-agent start

# Start sshd
service ssh start

[ ! -d /var/lock/apache2 ] && mkdir /var/lock/apache2
[ ! -d /var/run/apache2 ] && mkdir /var/run/apache2
[ ! -d /var/log/apache2 ] && mkdir /var/log/apache2

# Start Apache2
touch /var/log/apache2/access_$WEBSITE_ROLE_INSTANCE_ID.log
echo "$(date) Container started" >> /var/log/apache2/access_$WEBSITE_ROLE_INSTANCE_ID.log
/usr/sbin/apache2ctl -D FOREGROUND
