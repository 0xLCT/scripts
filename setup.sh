#!/bin/sh

# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# Install sudo
sudo apt install sudo -y

# Add Git PPA and install latest Git
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com A1715D88E1DF1F24 40976EAF437D05B5 3B4FE6ACC0B21F32 A6616109451BBBF2
sudo apt update
sudo apt install git -y

# Add user 'lucas'
adduser lucas

# Add user 'lucas' to sudo group
usermod -aG sudo lucas

# Clean up unnecessary packages and files
sudo apt autoremove -y
sudo apt autoclean
