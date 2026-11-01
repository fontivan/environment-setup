#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Rename gnome terminal to "default"
if command -v gsettings >/dev/null 2>&1 &&
    gsettings list-schemas | grep -Fxq "org.gnome.Terminal.ProfilesList"; then
    PROFILE_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
    gsettings set \
        "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROFILE_ID}/" \
        visible-name "'Default'"
fi

# Install oh my zsh
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"
mkdir -p "${ZSH_CUSTOM}/plugins"

for PLUGIN in zsh-syntax-highlighting zsh-autosuggestions; do
    PLUGIN_PATH="${ZSH_CUSTOM}/plugins/${PLUGIN}"
    if [[ ! -d "${PLUGIN_PATH}" ]]; then
        if [[ "${PLUGIN}" == "zsh-syntax-highlighting" ]]; then
            git clone "https://github.com/zsh-users/${PLUGIN}.git" "${PLUGIN_PATH}"
        else
            git clone "https://github.com/zsh-users/${PLUGIN}" "${PLUGIN_PATH}"
        fi
    fi
done

# Copy shell rc to home folder
cp "${SCRIPT_DIR}/../../etc/bash/.bashrc" "${HOME}/.bashrc"
cp "${SCRIPT_DIR}/../../etc/zsh/.zshrc" "${HOME}/.zshrc"

# Set default shell to zsh
ZSH_PATH=$(command -v zsh)
CURRENT_SHELL=$(getent passwd "${USER}" | cut -d: -f7)
if [[ "${CURRENT_SHELL}" != "${ZSH_PATH}" ]]; then
    chsh -s "${ZSH_PATH}"
fi
