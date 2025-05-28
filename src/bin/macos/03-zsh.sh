#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"

# Copy shell rc to home folder
cp "${SCRIPT_DIR}/../../etc/bash/.bashrc" "/Users/$(whoami)/.bashrc"
cp "${SCRIPT_DIR}/../../etc/zsh/.zshrc" "/Users/$(whoami)/.zshrc"

# Set default shell to zsh
chsh -s "$(which zsh)"
