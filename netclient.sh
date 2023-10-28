#!/bin/bash

# Function to add Netmaker repository
add_netmaker_repository() {
    echo "Adding Netmaker repository..."
    curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc || { echo "Error: Could not add Netmaker GPG key"; exit 1; }
    curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list || { echo "Error: Could not add Netmaker repository"; exit 1; }
}

# Function to install WireGuard and Netclient
install_wireguard_netclient() {
    echo "Installing WireGuard..."
    sudo apt install wireguard -y || { echo "Error: Could not install WireGuard"; exit 1; }

    add_netmaker_repository

    echo "Updating package list..."
    sudo apt update || { echo "Error: Could not update package list"; exit 1; }

    echo "Installing Netclient..."
    sudo apt install netclient -y || { echo "Error: Could not install Netclient"; exit 1; }
}

# Call the function to install WireGuard and Netclient
#!/bin/bash

echo "Press y or n: "
read -r input

if [ "$input" = "y" ]; then
  echo "Installing Netclient."
  install_wireguard_netclient
elif [ "$input" = "n" ]; then
  echo "Exiting..."
else
  echo "Invalid input."
fi



echo "Netclient installation completed."
