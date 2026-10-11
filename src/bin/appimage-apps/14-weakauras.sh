#!/usr/bin/env bash

# Version
WEAKAURAS_VERSION="5.2.7"

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/weakauras-client-latest.appimage"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi

URL="https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v${WEAKAURAS_VERSION}/WeakAuras-Companion-${WEAKAURAS_VERSION}.AppImage"

# Weakauras client
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown "${USER}:${USER}" "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/weakauras-client.desktop" <<EOF
[Desktop Entry]
Name=Weakauras
Comment=Weakauras Launcher
GenericName=Weakauras
Exec=${HOME}/appimages/weakauras-client-latest.appimage
Type=Application
StartupNotify=false
StartupWMClass=Weakauras
EOF
