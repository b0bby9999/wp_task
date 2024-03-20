# Deployment steps

Step 1: Launch EC2 Instances for WordPress

    Go to the AWS Management Console and navigate to the EC2 dashboard.
    Click on "Launch Instance", name the instance wp_server and choose the Linux AMI - ami-023adaba598e661ac
    Create new keypair chosing RSA encrtyption and .pem format
    Create new security group allowing SSH traffic from "My IP", allow HTTP and HTTPS traffic from internet.
    Keep default storage settings
    On Advanced details upload the user data file - wordpress.sh
    Chose number of instances - 2 and launch instance.

Step 2: Launch an RDS MySQL Instance

    Go to the RDS dashboard in the AWS Management Console.
    Click on "Create database" and choose MySQL as the database engine.
    Chose Standart Creation, select engine MySQL version 8.0.35 and select Free Tier template.
    Chose your db master password and make sure you remeber it.
    Keep default instance configuration. On the storage configuration chose Magnetic storage type for low cost.
    On the connectivity tab connect the RDS instance to the first webserver. Keep Automatic subnet group selection and chose default VPC group.
    Complete the creation process.

Step 3: Connect WP and DB servers

SSH to the both web servers and update information in the wp-config.php file as follows:

    define('DB_NAME', 'your_database_name');
    define('DB_USER', 'your_database_user');
    define('DB_PASSWORD', 'your_database_password');
    define('DB_HOST', 'your_rds_endpoint');

Replace your_database_name, your_database_user, your_database_password, and your_rds_endpoint with your actual RDS database information.

Complete the WordPress installation by accessing your EC2 instance's public IP address/domain name via a web browser and following the installation wizard and create blog post with title: The Heartbleed Bug and body:

    "The Heartbleed Bug is a serious vulnerability in the popular OpenSSL cryptographic software library. This weakness allows stealing the                 information protected, under normal conditions, by the SSL/TLS encryption used to secure the Internet. SSL/TLS provides communication security        and privacy over the Internet for applications such as web, email, instant messaging (IM) and some virtual private networks (VPNs).
    The Heartbleed bug allows anyone on the Internet to read the memory of the systems protected by the vulnerable versions of the OpenSSL software.        This compromises the secret keys used to identify the service providers and to encrypt the traffic, the names and passwords of the users and         the actual content. This allows attackers to eavesdrop on communications, steal data directly from the services and users and to impersonate          services and users."

    
