#!/usr/bin/env bash

TMP_EXTENSION_DIR="/tmp/gnome-extensions"
EXTENSION_DIR="/home/$(whoami)/.local/share/gnome-shell/extensions"
URL_PREFIX="https://extensions.gnome.org/extension-data"

EXTENSIONS_LIST=(
    "blur-my-shellaunetx.v47.shell-extension"
    "gsconnectandyholmes.github.io.v55.shell-extension"
    "reboottouefiubaygd.com.v13.shell-extension"
)

if [[ -d "${TMP_EXTENSION_DIR}" ]];
then
    rm -rf "${TMP_EXTENSION_DIR}"
fi

mkdir -p "${TMP_EXTENSION_DIR}"
cd "${TMP_EXTENSION_DIR}"

for EXTENSION in ${EXTENSIONS_LIST[@]};
do
    curl "${URL_PREFIX}/${EXTENSION}.zip" -o "${EXTENSION}.zip"
    unzip "${EXTENSION}.zip" -d "${EXTENSION}"
    rm "${EXTENSION}.zip"
    UUID="$(cat ${EXTENSION}/metadata.json | jq .uuid  | sed 's/\"//g')"
    cp -R "${EXTENSION}" ${EXTENSION_DIR}/${UUID}
    gnome-extensions enable "${UUID}"
done

rm -rf "${TMP_EXTENSION_DIR}"
