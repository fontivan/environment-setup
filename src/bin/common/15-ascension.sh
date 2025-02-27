#!/usr/bin/env bash

# Version
ASCENSION_VERSION="142"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/ascension-launcher-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://download.ascension-patch.gg/update/ascension-launcher-${ASCENSION_VERSION}.AppImage"

# Ascension launcher
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
