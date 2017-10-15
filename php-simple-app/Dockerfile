FROM debian

# Install PHP dependencies
RUN apt-get update && apt-get install -y \
	php5-common \
	php5-cli

# Copy this directory in to the container
COPY . /usr/src/app

# Set the working directory within the container to this directory
WORKDIR /usr/src/app

# Default command starts the interactive console
CMD ["php", "./index.php"]
