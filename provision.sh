#!/bin/sh
sudo adduser admin --gecos "" --ingroup admin --disabled-password
echo "admin:admin" | sudo chpasswd
mkdir -p /home/admin/.ssh
cat ssh-keys/id_rsa.pub >> /home/admin/.ssh/authorized_keys
chmod -R go= /home/admin/.ssh
chown -R admin:admin /home/admin/.ssh
