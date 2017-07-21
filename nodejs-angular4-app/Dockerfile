#  Create a new image from the base nodejs 7 image.
FROM node:8

MAINTAINER Yoichi Kawasaki https://github.com/yokawasa

COPY init_container.sh /bin/

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim openssh-server \
    && chmod 755 /bin/init_container.sh \
    && echo "root:Docker!" | chpasswd \
    && rm -rf /var/lib/apt/lists/*

# Create the target directory in the image
RUN mkdir -p /usr/src/nodejs/app

COPY sshd_config /etc/ssh/

# Set the created directory as the working directory
WORKDIR /usr/src/nodejs/app

# Copy the client application source files including package.json
#  You can use .dockerignore to exlcude files. Works just as .gitignore does.
#COPY webapp/* /home/nodejs/app/
COPY webapp /usr/src/nodejs/app

# Install required dependencies
RUN npm install --unsafe-perm=true 

# Open port 4200. This is the port that our development server uses
# Open port 2222. This is SSH login port
EXPOSE 4200 2222
ENV PORT 4200
# Start the application. This is the same as running ng serve.
#CMD ["npm", "start"]
ENTRYPOINT ["/bin/init_container.sh"]

