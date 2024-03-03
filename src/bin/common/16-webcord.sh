#!/usr/bin/env bash

# Version
WEBCORD_VERSION="4.8.0"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/webcord-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# Webcord client
sudo curl -L -o "${APPIMAGE_PATH}" https://github.com/SpacingBat3/WebCord/releases/download/v${WEBCORD_VERSION}/WebCord-${WEBCORD_VERSION}-x64.AppImage

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
