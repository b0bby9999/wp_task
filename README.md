# Deployment steps

Step 1: Launch EC2 Instances for WordPress

    Go to the AWS Management Console and navigate to the EC2 dashboard.
    Click on "Launch Instance" and choose the desired Linux AMI (ami-023adaba598e661ac).
    Configure the instance details (e.g., instance type, VPC, subnet, security group).
    Add storage, tags, and configure security groups to allow HTTP (port 80) and HTTPS (port 443) traffic.
    Launch the instance and repeat the process for the second EC2 instance.

Step 2: Launch an RDS MySQL Instance

    Go to the RDS dashboard in the AWS Management Console.
    Click on "Create database" and choose MySQL as the database engine.
    Configure the database details (e.g., DB instance class, username, password, database name).
    Adjust the network settings to ensure the RDS instance is accessible from both EC2 instances.
    Complete the creation process.

Step 3: Set Up WordPress on Each EC2 Instance

    SSH into each EC2 instance using the key pair you specified during instance creation.
    Install Apache, MySQL, PHP, and other required dependencies for WordPress.
    Download and extract WordPress into the web server directory (usually /var/www/html).
    Configure WordPress by editing the wp-config.php file and set up the database connection details as follows:

php

define('DB_NAME', 'your_database_name');
define('DB_USER', 'your_database_user');
define('DB_PASSWORD', 'your_database_password');
define('DB_HOST', 'your_rds_endpoint');

Replace your_database_name, your_database_user, your_database_password, and your_rds_endpoint with your actual RDS database information.

    Complete the WordPress installation by accessing your EC2 instance's public IP address/domain name via a web browser and following the installation wizard.

Step 4: Configure Security Groups

    Update the security group settings for both the EC2 instances and the RDS instance to allow inbound traffic on MySQL port (default is 3306) from the EC2 instances' security group.

    
