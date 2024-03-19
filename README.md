# wp_task

1. Use the YAML file for infrastructure deployment
2. Navigate to wp01 instance using ssh
3. Navigate to /var/www/html/wordpress and edit the wp-config.php file
4. At the row: define( 'DB_HOST', 'ENDPOINT_DBHOST' ); - replace ENDPOINT_DBHOST with the Database's endpoint from the RDS
5. Connect to the one of the two wordpress instances using instance's public DNS from the browser
6. Follow the setup instructions
7. Create blog with title: Heartbleed Bug and body: “The Heartbleed Bug is a serious vulnerability in the popular OpenSSL cryptographic software library. This weakness allows stealing the information protected, under normal conditions, by the SSL/TLS encryption used to secure the Internet. SSL/TLS provides communication security and privacy over the Internet for applications such as web, email, instant messaging (IM) and some virtual private networks (VPNs).
The Heartbleed bug allows anyone on the Internet to read the memory of the systems protected by the vulnerable versions of the OpenSSL software. This compromises the secret keys used to identify the service providers and to encrypt the traffic, the names and passwords of the users and the actual content. This allows attackers to eavesdrop on communications, steal data directly from the services and users and to impersonate services and users.”
