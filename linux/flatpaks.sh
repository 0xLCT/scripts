#!/bin/sh

# Function to prompt for Brave installation
install_brave() {
  echo "Do you want to install Brave (yes/no)?"
  read choice
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

# Function to prompt for media player installation
install_media_player() {
  echo "Do you want to install Haruna or Celluloid (H or C)?"
  read choice
  case "$choice" in
    haruna|Haruna|h|H )
      echo "Installing Haruna..."
      flatpak install --noninteractive --assumeyes org.kde.haruna
      ;;
    celluloid|Celluloid|c|C )
      echo "Installing Celluloid..."
      flatpak install --noninteractive --assumeyes io.github.celluloid_player.Celluloid
      ;;
    * )
      echo "Invalid choice. Please enter haruna or celluloid."
      install_media_player
      ;;
  esac
}

# Main function to coordinate installations
main() {
  # Install Brave based on user input
  install_brave

  # Install media player based on user input
  install_media_player

  # Install other flatpaks
  flatpak install --noninteractive --assumeyes \
    com.github.tchx84.Flatseal \
    com.stremio.Stremio \
    com.ulduzsoft.Birdtray \
    io.github.Hexchat \
    io.github.martinrotter.rssguard \
    it.mijorus.gearlever \
    org.mozilla.Thunderbird \
    org.remmina.Remmina \
    com.moonlight_stream.Moonlight \
    org.gimp.GIMP \
    md.obsidian.Obsidian
}

# Execute the main function
main
