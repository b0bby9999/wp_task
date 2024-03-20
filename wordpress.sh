#!/bin/bash

# Update package list
sudo apt update

# Install Apache
sudo apt install -y apache2

# Start and enable Apache service
sudo systemctl start apache2
sudo systemctl enable apache2

# Install other tools
sudo apt install -y gzip wget

# Download and extract WordPress
cd /tmp
wget -c https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo mv wordpress /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

# Create a WordPress configuration file
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i 's/database_name_here/wordpress/g' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/username_here/root/g' /var/www/html/wordpress/wp-config.php
sudo sed -i 's/password_here/YOUR_PASSWORD_HERE/g' /var/www/html/wordpress/wp-config.php

# Restart Apache to apply PHP changes
sudo systemctl restart apache2

