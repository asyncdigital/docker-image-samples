# Build:
# docker build -t meanjs/mean -f Dockerfile-production .
#
# Run: # docker run -it meanjs/mean
#
# Compose:
# docker-compose -f docker-compose-production.yml up -d

FROM ubuntu:latest
MAINTAINER MEAN.JS

# ENV setup
ENV APP_HOME "/home/site/wwwroot"
ENV SSH_PASSWD "root:Docker!"

# 80 = HTTP, 443 = HTTPS, 3000 = MEAN.JS server, 35729 = livereload
EXPOSE 80 443 3000 35729

# Install Utilities
RUN apt-get update -q  \
 && apt-get install -yqq \
 curl \
 git \
 ssh \
 gcc \
 make \
 build-essential \
 libkrb5-dev \
 sudo \
 apt-utils \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -yq nodejs \
 && apt-get install -y --no-install-recommends vim openssh-server \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install MEAN.JS Prerequisites
RUN npm install --quiet -g gulp bower yo mocha karma-cli pm2 && npm cache clean

RUN set -ex; \
    echo "root:Docker!" | chpasswd; \
    mkdir -p $APP_HOME; \
    ln -s $APPHOME /opt/mean.js

WORKDIR /opt/mean.js

# Set SSH
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY sshd_config /etc/ssh/sshd_config

RUN set -ex; \
    curl -s -L -O  https://github.com/Azure-Samples/meanjs/archive/master.tar.gz; \
    tar xf master.tar.gz; \
    mv meanjs-master/* meanjs-master/.[^\.]* /opt/mean.js/; \
    rm -rf meanjs-master master.tar.gz; \
    mkdir -p /opt/mean.js/public/lib /opt/mean.js/uploads; \
    chmod +x /usr/local/bin/docker-entrypoint.sh

# Copies the local package.json file to the container
# and utilities docker container cache to not needing to rebuild
# and install node_modules/ everytime we build the docker, but only
# when the local package.json file changes.
# Install npm packages
RUN NODE_ENV=development npm install --quiet && npm cache clean

# Install bower packages
RUN bower install --quiet --allow-root --config.interactive=false

# Set development environment as default
ENV NODE_ENV production

# Set Customized gulpfile.js
COPY gulpfile.js /opt/mean.js/gulpfile.js

# Run MEAN.JS server
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
