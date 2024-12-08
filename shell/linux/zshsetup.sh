#!/bin/sh

echo "Setting up ZSH configuration..."

# Create the plugins directory if it doesn't exist
echo "Creating directory structure..."
mkdir -p "$HOME/.config/zsh/plugins"

# Create an empty zsh history file if it doesn't exist
[ ! -f "$HOME/.config/zsh/zshhistory" ] && touch "$HOME/.config/zsh/zshhistory"

# Function to clone or update a git repository
clone_or_update() {
    repo="$1"
    dest="$2"
    if [ -d "$dest" ]; then
        echo "Updating $dest..."
        (cd "$dest" && git pull)
    else
        echo "Cloning $repo..."
        git clone --depth=1 "$repo" "$dest"
    fi
}

# Install/update plugins
clone_or_update "https://github.com/romkatv/powerlevel10k.git" "$HOME/powerlevel10k"
clone_or_update "https://github.com/zdharma-continuum/fast-syntax-highlighting" "$HOME/.config/zsh/plugins/fast-syntax-highlighting"
clone_or_update "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.config/zsh/plugins/zsh-autosuggestions"
clone_or_update "https://github.com/zsh-users/zsh-history-substring-search" "$HOME/.config/zsh/plugins/zsh-history-substring-search"

echo "ZSH setup completed successfully!"
