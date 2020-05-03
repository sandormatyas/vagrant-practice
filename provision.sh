#!/bin/sh
sudo adduser admin --gecos "" --disabled-password
echo "admin:admin" | sudo chpasswd
ssh-copy-id - i ./id_rsa.pub admin@localhost
