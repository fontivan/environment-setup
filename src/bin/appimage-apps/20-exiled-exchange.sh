#!/usr/bin/env bash

# Version
EXILED_EXCHANGE_VERSION="0.6.2"

# Parent Path
PARENT_PATH="/opt/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/exiled-exchange-2-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${EXILED_EXCHANGE_VERSION}/Exiled-Exchange-2-${EXILED_EXCHANGE_VERSION}.AppImage"

# Exiled exchange client
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown root:root "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
