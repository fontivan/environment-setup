#!/usr/bin/env bash

# Version
WOWUP_VERSION="2.20.0"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/wowup-client-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://github.com/WowUp/WowUp.CF/releases/download/v${WOWUP_VERSION}/WowUp-CF-${WOWUP_VERSION}.AppImage"

# Weakauras client
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
