#!/bin/bash

echo "Updating and upgrading"
sudo add-apt-repository ppa:ondrej/nginx
sudo apt update
sudo apt upgrade

echo "Adding new user"
source setup_new_user.sh

read -p "Do you need an NGINX installation? [YES/no]: " answer
case "$answer" in
    "YES")
        echo "Installing NGINX"
        source install_nginx.sh
        
        echo "Setting up NGINX"
        source setup_nginx.sh
        ;;
    "no")
        echo "Ok byeee."
        ;;
    *)
        echo "Yeah that won't work."
        ;;
esac