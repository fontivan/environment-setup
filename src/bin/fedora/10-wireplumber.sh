#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

WP_CONFIG_DIR="${HOME}/.config/wireplumber/wireplumber.conf.d/"

# Install wireplumber configuration and restart systemd service
mkdir -p "${WP_CONFIG_DIR}"
cp "${SCRIPT_DIR}/../../etc/wireplumber/51-disable-suspension.conf" \
    "${WP_CONFIG_DIR}"

systemctl daemon-reload --user
systemctl enable --user --now wireplumber
