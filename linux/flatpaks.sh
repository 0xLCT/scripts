#!/bin/bash

# Function to prompt for Brave installation
install_brave() {
  read -p "Do you want to install Brave (yes/no)? " choice
  case "$choice" in
    yes|Yes|y|Y )
      echo "Installing Brave..."
      flatpak install --noninteractive --assumeyes com.brave.Browser
      ;;
    no|No|n|N )
      echo "Skipping Brave installation."
      ;;
    * )
      echo "Invalid choice. Please enter yes or no."
      install_brave
      ;;
  esac
}

# Install Brave based on user input
install_brave

# Install other flatpaks
flatpak install --noninteractive --assumeyes \
  com.github.tchx84.Flatseal \
  com.stremio.Stremio \
  com.ulduzsoft.Birdtray \
  io.github.Hexchat \
  io.github.martinrotter.rssguard \
  it.mijorus.gearlever \
  org.mozilla.Thunderbird \
  io.github.celluloid_player.Celluloid \
  org.remmina.Remmina \
  com.moonlight_stream.Moonlight \
  org.gimp.GIMP \
  md.obsidian.Obsidian
