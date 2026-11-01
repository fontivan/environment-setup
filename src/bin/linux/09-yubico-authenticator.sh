#!/usr/bin/env bash

set -euo pipefail

YUBICO_AUTHENTICATOR_URL="https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-latest-linux.tar.gz"

YUBICO_AUTHENTICATOR="yubico-authenticator"
YUBICO_AUTHENTICATOR_PATH="${HOME}/.local/opt/${YUBICO_AUTHENTICATOR}"
TMP_PATH=$(mktemp -d)

trap 'rm -rf -- "${TMP_PATH}"' EXIT

curl -fL -o "${TMP_PATH}/${YUBICO_AUTHENTICATOR}.tar.gz" "${YUBICO_AUTHENTICATOR_URL}"
mkdir -p "${TMP_PATH}/install"
tar -xzf "${TMP_PATH}/${YUBICO_AUTHENTICATOR}.tar.gz" \
    --strip-components 1 -C "${TMP_PATH}/install"

chmod u+x "${TMP_PATH}/install/desktop_integration.sh"
chmod u+x "${TMP_PATH}/install/authenticator"

mkdir -p "$(dirname "${YUBICO_AUTHENTICATOR_PATH}")"
rm -rf -- "${YUBICO_AUTHENTICATOR_PATH}"
mv "${TMP_PATH}/install" "${YUBICO_AUTHENTICATOR_PATH}"

"${YUBICO_AUTHENTICATOR_PATH}/desktop_integration.sh" --install
