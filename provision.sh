#!/bin/sh
sudo apt update && sudo apt install sshpass
sudo adduser admin --gecos "" --ingroup admin --disabled-password
echo "admin:admin" | sudo chpasswd
echo "admin" | sshpass ssh-copy-id -f -i ./id_rsa.pub admin@localhost
sudo awk '/PermitRootLogin/ {gsub(/yes/, "no");gsub(/#/, "")} /PasswordAuthentication/ {gsub(/yes/, "no");gsub(/#/, "")};{print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config
sudo service ssh restart
