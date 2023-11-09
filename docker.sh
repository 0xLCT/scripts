#!/bin/sh

update_packages() {
    if ! sudo /usr/bin/apt-get update; then
        echo "Failed to update packages"
        exit 1
    fi
}

install_dependencies() {
    sudo /usr/bin/apt-get install ca-certificates curl gnupg -y
    if ! /usr/bin/apt-get install ca-certificates curl gnupg -y
    then
        echo "Failed to install dependencies"
        exit 1
    fi
}

add_docker_gpg_debian() {
    /usr/bin/mkdir -p /etc/apt/keyrings
    sudo chmod 0755 /etc/apt/keyrings
    if ! /usr/bin/curl -fsSL https://download.docker.com/linux/debian/gpg | /usr/bin/gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    then
        echo "Failed to add Docker's GPG key"
        exit 1
    fi
}

add_docker_gpg_ubuntu() {
    /usr/bin/mkdir -p /etc/apt/keyrings
    sudo chmod 0755 /etc/apt/keyrings
    if ! /usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    then
        echo "Failed to add Docker's GPG key"
        exit 1
    fi
}

if [ -e /etc/debian_version ]; then
    if grep -qi ubuntu /etc/os-release > /dev/null; then
        /usr/bin/apt-get remove docker docker.io containerd runc
        update_packages
        install_dependencies
        add_docker_gpg_ubuntu
    else
        for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do /usr/bin/apt-get remove $pkg; done
        update_packages
        install_dependencies
        add_docker_gpg_debian
    fi
    sudo echo "deb [arch=$(/bin/arch) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | /usr/bin/tee /etc/apt/sources.list.d/docker.list > /dev/null
    update_packages
    /usr/bin/apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y
else
   echo "Incompatible distribution"
   exit 1
fi
