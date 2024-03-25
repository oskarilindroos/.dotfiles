#!/bin/bash

# Update package lists
sudo apt update

# Install dependencies
sudo apt install -y git stow zsh tmux neovim ripgrep lazygit

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Make symbolic links
stow .
