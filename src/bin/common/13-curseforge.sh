#!/usr/bin/env bash

# Version
CURSEFORGE_VERSION="latest"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/curseforge-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# Install curseforge client
(
    if [[ -f "/tmp/curseforge" ]]; then
        rm -rf /tmp/curseforge
    fi
    mkdir -p /tmp/curseforge
    cd /tmp/curseforge
    sudo curl -L -o curseforge-latest.zip https://curseforge.overwolf.com/downloads/curseforge-${CURSEFORGE_VERSION}-linux.zip
    PACKAGE=$(unzip curseforge-latest.zip | grep inflating | awk -F '/' '{print $2}' | tr -d '[:space:]')
    sudo mv "build/${PACKAGE}" "${APPIMAGE_PATH}"
    cd /tmp
    rm -rf /tmp/curseforge
)

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
