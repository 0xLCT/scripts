#!/bin/bash

# Function to update packages
update_packages() {
    sudo apt-get update
    if [ $? -ne 0 ]; then
        echo "Failed to update packages"
        exit 1
    fi
}

# Function to install dependencies
install_dependencies() {
    sudo apt-get install ca-certificates curl gnupg -y
    if [ $? -ne 0 ]; then
        echo "Failed to install dependencies"
        exit 1
    fi
}

# Function to add Docker's GPG key
add_docker_gpg_debian() {
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    if [ $? -ne 0 ]; then
        echo "Failed to add Docker's GPG key"
        exit 1
    fi
}
add_docker_gpg_ubuntu() {
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    if [ $? -ne 0 ]; then
        echo "Failed to add Docker's GPG key"
        exit 1
    fi
}


# Check if system is Debian or Ubuntu and install Docker
if [ -e /etc/debian_version ]; then
    # Check if Ubuntu
    if grep -qi ubuntu /etc/os-release; then
        # Remove any existing Docker installs
        sudo apt-get remove docker docker.io containerd runc
        update_packages
        install_dependencies
        add_docker_gpg_ubuntu
    # Else must be Debian
    else
        # Remove any existing Docker packages
        for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
        update_packages
        install_dependencies
        add_docker_gpg_debian
    fi
    # Add Docker repository 
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    update_packages
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y
else
   echo "Incompatible distribution"
   exit 1
fi
