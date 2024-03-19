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

# Configure WordPress admin account
sudo wp --path=/var/www/html/wordpress core install --url="http://localhost" --title="My WordPress Site" --admin_user="wp_admin" --admin_password="123" --admin_email="admin@example.com"

# Create blog post
sudo wp --path=/var/www/html/wordpress post create --post_type=post --post_title="Heartbleed Bug" --post_content="The Heartbleed Bug is a serious vulnerability in the popular OpenSSL cryptographic software library. This weakness allows stealing the information protected, under normal conditions, by the SSL/TLS encryption used to secure the Internet. SSL/TLS provides communication security and privacy over the Internet for applications such as web, email, instant messaging (IM) and some virtual private networks (VPNs). The Heartbleed bug allows anyone on the Internet to read the memory of the systems protected by the vulnerable versions of the OpenSSL software. This compromises the secret keys used to identify the service providers and to encrypt the traffic, the names and passwords of the users and the actual content. This allows attackers to eavesdrop on communications, steal data directly from the services and users and to impersonate services and users."

echo "WordPress installation, admin account configuration, and blog post creation are complete."
