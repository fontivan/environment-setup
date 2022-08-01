#!/usr/bin/env bash

# Install terminal colors
# clone the repo into "$HOME/src/gogh"
(
    INSTALL_DIR="${HOME}/git/github"
    mkdir -p "${INSTALL_DIR}"
    cd "${INSTALL_DIR}"
    git clone https://github.com/Mayccoll/Gogh.git gogh
    cd gogh/themes

    # necessary on ubuntu
    export TERMINAL=gnome-terminal

    # install themes
    zsh ./aci.sh
    bash ./aci.sh
)
