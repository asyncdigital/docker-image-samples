#  Create a new image from the base nodejs 7 image.
FROM node:8

RUN apt-get update
RUN apt-get install -y vim

# Create the target directory in the imahge
RUN mkdir -p /home/nodejs/app

# Set the created directory as the working directory
WORKDIR /home/nodejs/app

# Copy the client application source files including package.json
#  You can use .dockerignore to exlcude files. Works just as .gitignore does.
#COPY webapp/* /home/nodejs/app/
COPY webapp /home/nodejs/app

# Install required dependencies
RUN npm install --unsafe-perm=true 

# Open port 4200. This is the port that our development server uses
EXPOSE 4200

# Start the application. This is the same as running ng serve.
CMD ["npm", "start"]
