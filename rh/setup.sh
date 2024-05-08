#!/bin/sh

# Update package lists
sudo dnf update -y

# Upgrade all packages
sudo dnf upgrade -y

# Install Git
sudo dnf install git -y

# Add user 'lucas'
sudo adduser lucas

# Add user 'lucas' to sudo group
sudo usermod -aG wheel lucas

# Clean up unnecessary packages and files
sudo dnf autoremove -y
sudo dnf clean all
