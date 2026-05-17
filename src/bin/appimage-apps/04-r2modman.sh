#!/usr/bin/env bash

# Version
RTWOMODMAN_VERSION="3.1.54"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/r2modman-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://gcdn.thunderstore.io/live/repository/packages/ebkr-r2modman-${RTWOMODMAN_VERSION}.zip"

# r2modman launcher
(
    if [[ -f "/tmp/r2modman" ]]; then
        rm -rf /tmp/r2modman
    fi
    mkdir -p /tmp/r2modman
    cd /tmp/r2modman || exit
    sudo curl -L -o r2modman-latest.zip "${URL}"
    unzip r2modman-latest.zip
    sudo mv r2modman-*.AppImage "${APPIMAGE_PATH}"
    cd /tmp || exit
    rm -rf /tmp/r2modman
)

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
