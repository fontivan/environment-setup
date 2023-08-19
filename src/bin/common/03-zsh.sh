#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Rename gnome terminal to "default"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")/ visible-name 'Default'

# Install oh my zsh
sh -c "CHSH=no $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"

# Install zsh auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy shell rc to home folder
cp $DIR/../../etc/bash/.bashrc /home/$(whoami)/.bashrc
cp $DIR/../../etc/zsh/.zshrc /home/$(whoami)/.zshrc

# Set default shell to zsh
chsh -s $(which zsh)
