# FROM ubuntu

# WORKDIR /my_dir

# RUN apt-get update -y

# RUN apt-get install apache2 -y

# COPY . /var/www/html

# COPY . /my_dir

# RUN  npm install

# EXPOSE 8099

# ENTRYPOINT apcahectl -D FOREGROUND


FROM ubuntu

# Set the working directory
WORKDIR /my_dir

# Update package lists
RUN apt-get update -y

# Install Apache2 and Node.js dependencies
RUN apt-get install apache2 -y
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -  # Install Node.js (replace 14.x with the version you need)
RUN apt-get install -y nodejs  # Install npm (Node.js includes npm)

# Install npm dependencies (assuming package.json exists in /my_dir)
COPY package.json /my_dir/
RUN npm install

# Copy application files to Apache's document root
COPY . /var/www/html

# Expose the port (default for Apache is 80, but if 8099 is needed for your app, leave it)
EXPOSE 8099

# Corrected ENTRYPOINT for Apache
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]





