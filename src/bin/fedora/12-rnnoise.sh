#!/usr/bin/env bash

# Install rnnoise for noise suppression
(
    cd /tmp
    curl -OL https://github.com/werman/noise-suppression-for-voice/releases/download/v1.03/linux-rnnoise.zip
    unzip linux-rnnoise.zip
    sudo mv linux-rnnoise /opt
    sudo chown root:root /opt/linux-rnnoise
    sudo chmod -R o+r /opt/linux-rnnoise
    rm -f linux-rnnoise.zip
)
