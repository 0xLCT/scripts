#!/bin/sh

main() {
    # Ask for confirmation
    read -p "This script will install Node.js on your system. Do you want to continue? (y/n) " -n 1 -r
    echo    # move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Installation cancelled."
        exit 1
    fi

    # Ask for Node.js version
    echo "Please enter the version of Node.js you want to install (e.g., 14): "
    read VERSION

    echo "Installing Node.js version $VERSION..."

    # Check if sudo is installed
    if ! command -v sudo >/dev/null 2>&1; then
        echo "sudo is required but it's not installed. Installing sudo..."
        apt-get update
        apt-get install -y sudo
    fi

    # Install Node.js from NodeSource
    curl -sL https://deb.nodesource.com/setup_${VERSION}.x | sudo -E bash -
    sudo apt-get install -y nodejs

    # Verify installation
    if command -v node >/dev/null 2>&1; then
        echo "Node.js is installed successfully."
        node -v
    else
        echo "Node.js is not installed. Please check for any errors above."
    fi

}
main