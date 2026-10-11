#!/usr/bin/env bash

# Version
ARCHON_VERSION="9.6.80"

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

# AppImage path
APPIMAGE_PATH="${PARENT_PATH}/archon-lite-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://github.com/RPGLogs/Uploaders-archon-lite/releases/download/v${ARCHON_VERSION}/archon-lite-v${ARCHON_VERSION}.AppImage"

# Archon client
curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
chmod 755 "${APPIMAGE_PATH}"
