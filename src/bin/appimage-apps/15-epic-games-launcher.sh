#!/usr/bin/env bash

# Parent Path
PARENT_PATH="/home/${USER}/appimages"

# AppImage path
APPIMAGE_PATH="${PARENT_PATH}/epic-games-launcher-latest.appimage"

# Icon path
ICON_PATH="${HOME}/.local/share/icons/epic-games-launcher.png"

# Prep parent folder
if [[ ! -d "${PARENT_PATH}" ]]; then
    mkdir -p "${PARENT_PATH}"
fi
mkdir -p "$(dirname "${ICON_PATH}")"

URL="https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncher-x86_64.AppImage"

# Install Epic Games Launcher
sudo curl -L -o "${APPIMAGE_PATH}" "${URL}"

# Set permissions
sudo chown "${USER}:${USER}" "${APPIMAGE_PATH}"
sudo chmod 755 "${APPIMAGE_PATH}"

TEMP_DIR=$(mktemp -d) || exit 1
trap 'rm -rf "${TEMP_DIR}"' EXIT
if ! (
    cd "${TEMP_DIR}" || exit
    "${APPIMAGE_PATH}" --appimage-extract >/dev/null
); then
    printf 'Failed to extract Epic Games Launcher icon from %s\n' "${APPIMAGE_PATH}" >&2
    exit 1
fi
EXTRACTED_ICON="${TEMP_DIR}/squashfs-root/epic-games-launcher.png"
if [[ ! -f "${EXTRACTED_ICON}" ]]; then
    printf 'Epic Games Launcher icon was not found in %s\n' "${APPIMAGE_PATH}" >&2
    exit 1
fi
if ! cp "${EXTRACTED_ICON}" "${ICON_PATH}"; then
    printf 'Failed to install Epic Games Launcher icon to %s\n' "${ICON_PATH}" >&2
    exit 1
fi

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/epic-games-launcher.desktop" <<EOF
[Desktop Entry]
Name=Epic Games Launcher
Comment=Epic Games Launcher
GenericName=Epic Games Launcher
Exec=${HOME}/appimages/epic-games-launcher-latest.appimage
Icon=${ICON_PATH}
Type=Application
StartupNotify=false
EOF
