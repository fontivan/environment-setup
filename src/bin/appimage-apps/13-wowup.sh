#!/usr/bin/env bash

# Version
WOWUP_VERSION="2.20.0"

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

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
sudo chown "${USER}:${USER}" "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/wowup-client.desktop" <<EOF
[Desktop Entry]
Name=WoWUP
Comment=WoWUP Client
GenericName=WoWUP
Exec=${HOME}/appimages/wowup-client-latest.appimage
Type=Application
StartupNotify=false
StartupWMClass=WoWUP
EOF
