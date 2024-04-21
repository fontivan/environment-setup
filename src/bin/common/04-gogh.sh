#!/usr/bin/env bash

# Install terminal colors
# clone the repo into "$HOME/src/gogh"
URL="https://github.com/Mayccoll/Gogh.git"
(
    INSTALL_DIR="${HOME}/git/github"
    mkdir -p "${INSTALL_DIR}"
    cd "${INSTALL_DIR}" || exit
    git clone "${URL}" gogh
    cd gogh/themes || exit

    # necessary on ubuntu
    export TERMINAL=gnome-terminal

    # install themes
    zsh ./aci.sh
    bash ./aci.sh
)
