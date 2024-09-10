#!/bin/sh

CURRENT_USER=$(whoami)

echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
sudo apt update
sudo apt install syncthing
sudo systemctl enable "syncthing@$CURRENT_USER.service"
sudo systemctl start "syncthing@$CURRENT_USER.service"
