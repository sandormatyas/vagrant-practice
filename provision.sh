#!/bin/sh
sudo apt install sshpass
sudo adduser admin --gecos "" --disabled-password
echo "admin:admin" | sudo chpasswd
echo "admin" | shhpass ssh-copy-id -f -i ./id_rsa.pub admin@localhost
awk '/PermitRootLogin/ {gsub(/yes/, "no")};{print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config
awk '/PasswordAuthentication/ {gsub(/yes/, "no")};{print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config
service sshd restart
