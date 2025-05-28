#!/usr/bin/env bash

VERSION="v1.10"

URL="https://github.com/werman/noise-suppression-for-voice/releases/download/${VERSION}/linux-rnnoise.zip"
TMP_PATH="/tmp/linux-rnnoise"
RNNOISE_PATH="/opt/linux-rnnoise"

# Install rnnoise for noise suppression
(
    cd /tmp || exit
    if [[ -d "${TMP_PATH}" ]]; then
        rm -rf "${TMP_PATH}"
    fi
    curl -OL "${URL}"
    unzip linux-rnnoise.zip
    if [[ -d "${RNNOISE_PATH}" ]]; then
        sudo rm -rf "${RNNOISE_PATH}"
    fi
    sudo mkdir -p "${RNNOISE_PATH}"
    sudo cp -R linux-rnnoise/* "${RNNOISE_PATH}"
    sudo chown root:root "${RNNOISE_PATH}"
    sudo chmod -R o+r "${RNNOISE_PATH}"
    rm -f linux-rnnoise.zip
    rm -rf "${TMP_PATH}"
)
