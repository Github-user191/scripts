#!/bin/bash

# Update packages
sudo apt update -y

# Install Nginx
sudo apt install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Output the hostname of the machine
HOSTNAME=$(hostname)
echo "This server's hostname is: $HOSTNAME"

# Create a simple static webpage with the hostname
echo "<html>
<head><title>Welcome</title></head>
<body>
<h1>Welcome to $HOSTNAME</h1>
</body>
</html>" | sudo tee /var/www/html/index.html

# Restart Nginx to apply changes
sudo systemctl restart nginx
