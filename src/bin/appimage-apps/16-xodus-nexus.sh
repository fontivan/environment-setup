#!/usr/bin/env bash

XODUS_NEXUS_VERSION="0.3.7"

PARENT_PATH="${HOME}/appimages"
APPIMAGE_PATH="${PARENT_PATH}/xodus-nexus-latest.appimage"
ICON_PATH="${HOME}/.local/share/icons/xodus-nexus.png"
URL="https://github.com/domsvoboda/xodus-nexus/releases/download/v${XODUS_NEXUS_VERSION}/Xodus-Nexus-${XODUS_NEXUS_VERSION}-x86_64.AppImage"
ICON_URL="https://raw.githubusercontent.com/domsvoboda/xodus-nexus/main/assets/icon.png"

mkdir -p "${PARENT_PATH}" || exit 1
curl -fL -o "${APPIMAGE_PATH}" "${URL}" || exit 1
chmod 755 "${APPIMAGE_PATH}" || exit 1

mkdir -p "$(dirname "${ICON_PATH}")" || exit 1
curl -fL -o "${ICON_PATH}" "${ICON_URL}" || exit 1

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}" || exit 1
cat > "${APPLICATIONS_PATH}/xodus-nexus.desktop" <<EOF
[Desktop Entry]
Name=Xodus Nexus
Comment=Launcher for Microsoft Store PC games on Linux
GenericName=Xodus Nexus
Exec=${APPIMAGE_PATH}
Icon=${ICON_PATH}
Type=Application
StartupNotify=false
EOF
