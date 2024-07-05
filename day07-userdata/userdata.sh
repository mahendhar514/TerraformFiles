#!/bin/bash
yum install -y httpd
service httpd start
chkconfig httpd on
echo "this my web page from terraform instance" > /var/www/html/index.html

# installing other application
yum install git -y
yum install docker -y
yum install ansible -y