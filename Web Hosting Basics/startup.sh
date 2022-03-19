#!/bin/bash
sudo systemctl enable nginx >> /var/log/cloud-init-user-data.log
sudo systemctl start nginx >> /var/log/cloud-init-user-data.log
sudo systemctl status nginx >> /var/log/cloud-init-user-data.log