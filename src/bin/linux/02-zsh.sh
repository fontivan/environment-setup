#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Rename gnome terminal to "default"
gsettings set org.gnome.Terminal.Legacy.Profile:"/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")/ visible-name 'Default'"

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

# Copy shell rc to home folder
cp "${SCRIPT_DIR}/../../etc/bash/.bashrc" "/home/$(whoami)/.bashrc"
cp "${SCRIPT_DIR}/../../etc/zsh/.zshrc" "/home/$(whoami)/.zshrc"

# Set default shell to zsh
chsh -s "$(which zsh)"
