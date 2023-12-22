#!/bin/sh

if grep -q '^ID=ubuntu' /etc/os-release; then
   bash <(curl -s https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/dockerubuntu.sh)
   sudo groupadd docker
   sudo usermod -aG docker $USER
   newgrp docke
elif grep -q '^ID=debian' /etc/os-release; then
   bash <(curl -s https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/dockerdeb.sh)
   sudo groupadd docker
   sudo usermod -aG docker $USER
   newgrp docker
else
   echo "Unknown OS"
fi
