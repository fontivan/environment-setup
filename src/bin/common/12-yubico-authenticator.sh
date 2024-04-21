#!/usr/bin/env bash

YUBICO_AUTHENTICATOR_URL="https://developers.yubico.com/yubioath-flutter/Releases/yubico-authenticator-latest-linux.tar.gz"

YUBICO_AUTHENTICATOR="yubico-authenticator"
TARBALL="${YUBICO_AUTHENTICATOR}.tar.gz"

(
    cd /tmp || exit

    curl -L -o "${TARBALL}" "${YUBICO_AUTHENTICATOR_URL}"
    mkdir -p "${YUBICO_AUTHENTICATOR}"
    tar -xvf "${TARBALL}" --strip-components 1 -C "${YUBICO_AUTHENTICATOR}"
    rm "${TARBALL}"

    sudo chown -R root:root "${YUBICO_AUTHENTICATOR}"
    sudo chmod +rx "/tmp/${YUBICO_AUTHENTICATOR}/desktop_integration.sh"
    sudo chmod +rx "/tmp/${YUBICO_AUTHENTICATOR}/authenticator"
    sudo mv "/tmp/${YUBICO_AUTHENTICATOR}" /opt/

    /opt/${YUBICO_AUTHENTICATOR}/desktop_integration.sh --install
)
