#!/bin/bash

read -p "Enter the new username: " new_username

echo "Adding $new_username"
sudo adduser $new_username

echo "Adding $new_username to the sudo group"
sudo usermod -aG sudo $new_username

echo "Copying SSH keys"
mkdir -p /home/$new_username/.ssh
chown $new_username:$new_username /home/$new_username/.ssh
sudo cp /root/.ssh/authorized_keys /home/$new_username/.ssh
chown $new_username:$new_username /home/$new_username/.ssh/authorized_keys
chmod 600 /home/$new_username/.ssh/authorized_keys

echo "Disabling password authentification"
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Setup completed for user: $new_username"
 