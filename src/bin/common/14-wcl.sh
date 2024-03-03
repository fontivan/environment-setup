#!/usr/bin/env bash

# Version
WARCRAFTLOGS_VERSION="8.3.4"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/warcraftlogs-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]];
then
    mkdir -p "${PARENT_PATH}"
fi

# Warcraft logs client
sudo curl -L -o "${APPIMAGE_PATH}" https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v${WARCRAFTLOGS_VERSION}/warcraftlogs-v${WARCRAFTLOGS_VERSION}.AppImage

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
