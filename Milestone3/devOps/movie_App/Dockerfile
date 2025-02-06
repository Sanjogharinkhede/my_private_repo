
FROM ubuntu

# Set the working directory
WORKDIR /my_dir

# Update package lists
RUN apt-get update -y

# Install Apache2 and Node.js dependencies
RUN apt-get install apache2 -y


# Copy application files to Apache's document root
COPY . /var/www/html

# Expose the port (default for Apache is 80, but if 8099 is needed for your app, leave it)
EXPOSE 8099

# Corrected ENTRYPOINT for Apache
ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
