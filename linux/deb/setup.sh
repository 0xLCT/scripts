#!/bin/sh

# Check if sudo is installed
if ! command -v sudo > /dev/null 2>&1; then
  su -c 'apt install sudo'
fi

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# Add Git PPA and install latest Git
sudo apt install git -y

# Add user 'lucas'
adduser lucas

# Add user 'lucas' to sudo group
usermod -aG sudo lucas

# Clean up unnecessary packages and files
sudo apt autoremove -y
sudo apt autoclean
