#!/bin/bash

# Install necessary packages
sudo apt update
sudo apt install -y apache2 php libapache2-mod-php unzip

# Download WordPress
wget -P /tmp https://wordpress.org/latest.zip

# Unzip WordPress
sudo unzip /tmp/latest.zip -d /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress

# Create Apache virtual host configuration
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf
sudo sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/wordpress|g' /etc/apache2/sites-available/wordpress.conf
sudo sed -i '$a <Directory /var/www/html/wordpress>' /etc/apache2/sites-available/wordpress.conf
sudo sed -i '$a     AllowOverride All' /etc/apache2/sites-available/wordpress.conf
sudo sed -i '$a </Directory>' /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress.conf

# Restart Apache
sudo systemctl restart apache2

# Configure WordPress to connect to external MySQL database
sudo cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo sed -i "s|define('DB_NAME', '.*');|define('DB_NAME', 'db01');|g" /var/www/html/wordpress/wp-config.php
sudo sed -i "s|define('DB_USER', '.*');|define('DB_USER', 'db_admin');|g" /var/www/html/wordpress/wp-config.php
sudo sed -i "s|define('DB_PASSWORD', '.*');|define('DB_PASSWORD', 'Random_Password.123');|g" /var/www/html/wordpress/wp-config.php
