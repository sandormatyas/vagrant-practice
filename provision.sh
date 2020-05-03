#!/bin/sh
sudo adduser admin --gecos "" --disabled-password
echo "admin:admin" | sudo chpasswd
ssh-copy-id - i ./id_rsa.pub admin@localhost
awk '/PermitRootLogin/ {gsub(/yes/, "no")};{print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config
awk '/PasswordAuthentication/ {gsub(/yes/, "no")};{print}' /etc/ssh/sshd_config > /etc/ssh/sshd_config
service sshd restart
