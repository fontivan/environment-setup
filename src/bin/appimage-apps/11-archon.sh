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

APPLICATIONS_PATH="${HOME}/.local/share/applications"
ICONS_PATH="${HOME}/.local/share/icons/hicolor/512x512/apps"
ARCHON_ICON_PATH="${ICONS_PATH}/archon.png"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/archon.desktop" <<EOF
[Desktop Entry]
Name=Archon
Comment=Archon Client
GenericName=Archon
Exec=${HOME}/appimages/archon-lite-latest.appimage --no-sandbox
Icon=archon
Type=Application
StartupNotify=false
StartupWMClass=Archon
EOF

if [[ ! -f "${ARCHON_ICON_PATH}" ]]; then
    TEMP_DIR=$(mktemp -d) || exit 1
    trap 'rm -rf "${TEMP_DIR}"' EXIT
    if ! (
        cd "${TEMP_DIR}" || exit
        "${APPIMAGE_PATH}" --appimage-extract \
            "usr/share/icons/hicolor/512x512/apps/archon-lite.png" >/dev/null
    ); then
        printf 'Failed to extract Archon icon from %s\n' "${APPIMAGE_PATH}" >&2
        exit 1
    fi
    EXTRACTED_ICON="${TEMP_DIR}/squashfs-root/usr/share/icons/hicolor/512x512/apps/archon-lite.png"
    if [[ ! -f "${EXTRACTED_ICON}" ]]; then
        printf 'Archon icon was not found in %s\n' "${APPIMAGE_PATH}" >&2
        exit 1
    fi
    mkdir -p "${ICONS_PATH}" &&
        cp "${EXTRACTED_ICON}" "${ARCHON_ICON_PATH}" || exit 1
fi
