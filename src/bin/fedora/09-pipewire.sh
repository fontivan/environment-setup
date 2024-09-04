#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install pipewire configuration into the conf.d folder and restart pipewire service
PIPEWIRE_CONF_DIR="${HOME}/.config/pipewire/pipewire.conf.d/"
DENOISING_FILE="99-input-denoising.conf"

mkdir -p "${PIPEWIRE_CONF_DIR}"
cp "${SCRIPT_DIR}/../../etc/pipewire/${DENOISING_FILE}" \
    "${PIPEWIRE_CONF_DIR}/${DENOISING_FILE}"

systemctl daemon-reload --user
systemctl restart --user pipewire.service
