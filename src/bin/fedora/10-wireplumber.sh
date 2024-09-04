#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install wireplumber configuration into the conf.d folder and restart wireplumber service
WP_CONFIG_DIR="${HOME}/.config/wireplumber/wireplumber.conf.d/"
WP_FILE="51-disable-suspension.conf"

mkdir -p "${WP_CONFIG_DIR}"
cp "${SCRIPT_DIR}/../../etc/wireplumber/${WP_FILE}" \
    "${WP_CONFIG_DIR}/${WP_FILE}"

systemctl daemon-reload --user
systemctl restart --user wireplumber.service
