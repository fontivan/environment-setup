#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Rename gnome terminal to "default"
gsettings set org.gnome.Terminal.Legacy.Profile:"/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")/ visible-name 'Default'"

# Install oh my zsh
sh -c "CHSH=no $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

# Install zsh auto complete
URL_AUTOSUGGESTION="https://github.com/zsh-users/zsh-autosuggestions"
git clone "${URL_AUTOSUGGESTION}" "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Install zsh syntax highlighting
URL_HIGHLIGHT="https://github.com/zsh-users/zsh-syntax-highlighting.git"
git clone "${URL_HIGHLIGHT}" "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Copy shell rc to home folder
cp "${SCRIPT_DIR}/../../etc/bash/.bashrc" "/home/$(whoami)/.bashrc"
cp "${SCRIPT_DIR}/../../etc/zsh/.zshrc" "/home/$(whoami)/.zshrc"

# Set default shell to zsh
chsh -s "$(which zsh)"
