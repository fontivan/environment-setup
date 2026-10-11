#!/usr/bin/env bash

# Version
CPU_X_VERSION="5.1.2"

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/cpu-x-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://github.com/TheTumultuousUnicornOfDarkness/CPU-X/releases/download/v${CPU_X_VERSION}/CPU-X-${CPU_X_VERSION}-x86_64.AppImage"

# CPU-X client
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown "${USER}:${USER}" "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
