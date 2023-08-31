#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "------ This script must be run as root."
   exit 1
fi

apt install -y nginx > /dev/null 2>&1

systemctl start nginx
systemctl enable nginx

if [ -x "$(command -v ufw)" ]; then
    if ufw status | grep -q "Status: active"; then
        ufw allow 'Nginx HTTP'
        ufw allow 'Nginx HTTPS'
        ufw reload
        echo "------ UFW configuration completed."
    else
        echo "------ UFW is not active. Skipping firewall configuration."
    fi
else
    echo "------ UFW is not installed. Skipping firewall configuration."
fi

systemctl status nginx

echo "------ Nginx installation completed."