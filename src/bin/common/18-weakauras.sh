#!/usr/bin/env bash

# Version
WEAKAURAS_VERSION="5.2.3"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/weakauras-client-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# Weakauras client
sudo curl -L -o "${APPIMAGE_PATH}" https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v${WEAKAURAS_VERSION}/WeakAuras-Companion-${WEAKAURAS_VERSION}.AppImage

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
