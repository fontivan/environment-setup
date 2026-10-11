#!/usr/bin/env bash

# Version
CURSEFORGE_VERSION="latest"

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

# Appimage path
APPIMAGE_PATH="${PARENT_PATH}/curseforge-latest.appimage"

# Icon path
ICON_PATH="${HOME}/.local/share/icons/hicolor/256x256/apps/curseforge.png"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi
mkdir -p "$(dirname "${ICON_PATH}")"

URL="https://curseforge.overwolf.com/downloads/curseforge-${CURSEFORGE_VERSION}-linux.zip"

# Install curseforge client
(
    if [[ -f "/tmp/curseforge" ]]; then
        rm -rf /tmp/curseforge
    fi
    mkdir -p /tmp/curseforge
    cd /tmp/curseforge || exit
    sudo curl -L -o curseforge-latest.zip "${URL}"
    unzip curseforge-latest.zip
    # shellcheck disable=SC2010
    PACKAGE=$(ls | grep 'CurseForge')
    sudo mv "${PACKAGE}" "${APPIMAGE_PATH}"
    "${APPIMAGE_PATH}" --appimage-extract >/dev/null
    cp squashfs-root/usr/share/icons/hicolor/256x256/apps/curseforge.png "${ICON_PATH}"
    rm -rf squashfs-root
    cd /tmp || exit
    rm -rf /tmp/curseforge
)

# Set permissions
sudo chown ${USER}:${USER} "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"
sudo chown "${USER}:${USER}" "${ICON_PATH}"

# Set login auth redirect
xdg-mime default curseforge.desktop x-scheme-handler/cfauth
sudo update-desktop-database ~/.local/share/applications
