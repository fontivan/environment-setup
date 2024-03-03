#!/usr/bin/env bash

# Version
WOOTILITY_VERSION="4.6.15"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/wootility.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# wootility
sudo curl -L -o "${APPIMAGE_PATH}" https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-latest/wootility-lekker-${WOOTILITY_VERSION}.AppImage

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
