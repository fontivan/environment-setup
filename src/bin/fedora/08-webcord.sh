#!/usr/bin/env bash

# Install webcord from github
(
    cd /tmp
    curl -OL https://github.com/SpacingBat3/WebCord/releases/download/v3.5.2/webcord-3.5.2-1.x86_64.rpm
    sudo dnf localinstall ./webcord-3.5.2-1.x86_64.rpm
    rm webcord-3.5.2-1.x86_64.rpm
)
