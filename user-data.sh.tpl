#!/bin/bash
sudo su 
sudo yum update
sudoyum install httpd -y
sudo service httpd start
chkconfig httpd on 

cat <<EOF > /usr/share/nginx/html/index.html
<html>
<title> ${version} Version </title>
<body style= "background-color:${color};">
<h1> This the ${version} ! </h1>
</body>
</html>
EOF