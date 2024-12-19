#!/usr/bin/env bash

# Install terminal colors
# clone the repo into "$HOME/src/gogh"
URL="https://github.com/Mayccoll/Gogh.git"
(
    # Clone the repo into "$HOME/src/gogh"
    mkdir -p "$HOME/src"
    cd "$HOME/src"
    git clone https://github.com/Gogh-Co/Gogh.git gogh
    cd gogh

    # necessary in the Gnome terminal on ubuntu
    export TERMINAL=gnome-terminal

    # necessary in the Alacritty terminal
    pip install -r requirements.txt
    export TERMINAL=alacritty

    # Enter theme installs dir
    cd installs

    # install themes
    zsh ./aci.sh
    bash ./aci.sh
)
