#!/bin/sh

# Function to install vscode
install_vscode() {
    echo "Updating packages..."
    sudo apt-get update

    echo "Installing dependencies..."
    sudo apt-get install -y software-properties-common apt-transport-https wget

    echo "Importing Microsoft GPG key..."
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    echo "Enabling the Visual Studio Code repository..."
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    echo "Updating packages again..."
    sudo apt-get update

    echo "Installing Visual Studio Code..."
    sudo apt-get install -y code
}

# Ask for confirmation
echo "This script will install Visual Studio Code. Do you want to continue? (y/n) "
read confirmation

# Check user's response
case $confirmation in
    [yY]* ) install_vscode;;
    [nN]* ) echo "Installation cancelled.";;
    * ) echo "Please answer yes or no.";;
esac
