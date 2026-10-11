#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
APPLICATIONS_PATH="${HOME}/.local/share/applications"
ICONS_PATH="${HOME}/.local/share/icons/hicolor/512x512/apps"

# Install desktop icons
mkdir -p "${APPLICATIONS_PATH}"

for desktop_entry in "${SCRIPT_DIR}"/../../etc/icons/*.desktop; do
    sed "s|@HOME@|${HOME}|g" "${desktop_entry}" \
        > "${APPLICATIONS_PATH}/$(basename "${desktop_entry}")"
done

mkdir -p "${ICONS_PATH}"
cp "${SCRIPT_DIR}"/../../etc/icons/archon.png "${ICONS_PATH}/archon.png"
