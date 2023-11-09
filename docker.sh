#!/bin/sh

if grep -q '^ID=ubuntu' /etc/os-release; then
   bash <(curl -s https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/dockerubuntu.sh)
elif grep -q '^ID=debian' /etc/os-release; then
   bash <(curl -s https://raw.githubusercontent.com/lctrevizan/ubuntuscript/main/dockerdeb.sh)
else
   echo "Unknown OS"
fi
