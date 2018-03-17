FROM php:7.0-apache
MAINTAINER Yoichi Kawasaki <yoichi.kawasaki@microsoft.com>

RUN apt-get update \
    && apt-get install -y vim ctags tmux curl \
    && apt install -y --no-install-recommends openssh-server \
    && apt-get clean

# install td-agent
RUN curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - \
    && echo "deb http://packages.treasuredata.com/3/debian/jessie/ jessie contrib" > /etc/apt/sources.list.d/treasure-data.list \
    && apt-get update \
    && apt-get install -y td-agent

# install fluent plugins
RUN td-agent-gem install fluent-plugin-copy_ex \
    && td-agent-gem install fluent-plugin-elasticsearch

RUN a2enmod rewrite expires include

COPY apache2.conf /etc/apache2/
#COPY other-vhosts-access-log.conf /etc/apache2/conf-available/
COPY init_container.sh /bin/
COPY webapp /var/www/html/
COPY td-agent.conf /etc/td-agent/
COPY sshd_config /etc/ssh/

# install the PHP extensions we need
RUN rm -f /var/log/apache2/* \
    && rmdir /var/lock/apache2 /var/run/apache2 /var/log/apache2 \
    && chmod 777 /var/log /var/run /var/lock \
    && chmod 777 /bin/init_container.sh \
    && echo "root:Docker!" | chpasswd \
    && rmdir /var/log/td-agent \
    && mkdir -p /home/LogFiles

EXPOSE 8080 2222

ENV PORT 8080
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance

WORKDIR /var/www/html
ENTRYPOINT ["/bin/init_container.sh"]
