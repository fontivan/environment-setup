#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install pipewire configuration into the conf.d folder and restart pipewire service
PIPEWIRE_CONF_DIR="${HOME}/.config/pipewire/"

mkdir -p "${PIPEWIRE_CONF_DIR}"
cp -R ${SCRIPT_DIR}/../../etc/pipewire/* \
    "${PIPEWIRE_CONF_DIR}/"

systemctl daemon-reload --user
systemctl restart --user pipewire.service
