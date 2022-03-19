#!/bin/bash
echo "<h1> Coming soon </h1>" > /usr/share/nginx/html/index.html
echo "<h4> `hostname` </h4>" >> /usr/share/nginx/html/index.html
sudo systemctl enable nginx >> /var/log/cloud-init-user-data.log
sudo systemctl start nginx >> /var/log/cloud-init-user-data.log
sudo systemctl status nginx >> /var/log/cloud-init-user-data.log