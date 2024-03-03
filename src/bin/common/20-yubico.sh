#!/usr/bin/env bash

# Version
YUBICO_MANAGER_VERSION="latest"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/yubico-manager-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# yubico manager
sudo curl -L -o "${APPIMAGE_PATH}" https://developers.yubico.com/yubikey-manager-qt/Releases/yubikey-manager-qt-${YUBICO_MANAGER_VERSION}-linux.AppImage

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
