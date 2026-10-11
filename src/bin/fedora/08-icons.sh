#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
APPLICATIONS_PATH="${HOME}/.local/share/applications"
ICONS_PATH="${HOME}/.local/share/icons/hicolor/512x512/apps"
ARCHON_APPIMAGE="${HOME}/appimages/archon-lite-latest.appimage"
ARCHON_ICON_PATH="${ICONS_PATH}/archon.png"

# Install desktop icons
mkdir -p "${APPLICATIONS_PATH}"

for desktop_entry in "${SCRIPT_DIR}"/../../etc/icons/*.desktop; do
    sed "s|@HOME@|${HOME}|g" "${desktop_entry}" \
        > "${APPLICATIONS_PATH}/$(basename "${desktop_entry}")"
done

if [[ ! -f "${ARCHON_ICON_PATH}" ]]; then
    if [[ ! -x "${ARCHON_APPIMAGE}" ]]; then
        printf 'Archon AppImage is missing or not executable: %s\n' "${ARCHON_APPIMAGE}" >&2
        exit 1
    fi
    TEMP_DIR=$(mktemp -d) || exit 1
    trap 'rm -rf "${TEMP_DIR}"' EXIT
    if ! (
        cd "${TEMP_DIR}" || exit
        "${ARCHON_APPIMAGE}" --appimage-extract \
            "usr/share/icons/hicolor/512x512/apps/archon-lite.png" >/dev/null
    ); then
        printf 'Failed to extract Archon icon from %s\n' "${ARCHON_APPIMAGE}" >&2
        exit 1
    fi
    EXTRACTED_ICON="${TEMP_DIR}/squashfs-root/usr/share/icons/hicolor/512x512/apps/archon-lite.png"
    if [[ ! -f "${EXTRACTED_ICON}" ]]; then
        printf 'Archon icon was not found in %s\n' "${ARCHON_APPIMAGE}" >&2
        exit 1
    fi
    mkdir -p "${ICONS_PATH}" &&
        cp "${EXTRACTED_ICON}" "${ARCHON_ICON_PATH}" || exit 1
fi
