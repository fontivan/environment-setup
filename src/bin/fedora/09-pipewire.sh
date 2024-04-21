#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install pipewire configuration and systemd service to run it automatically
mkdir -p ~/.config/pipewire ~/.config/systemd/user
cp "${SCRIPT_DIR}/../../etc/pipewire/pipewire-input-filter-chain.conf" \
    "${HOME}/.config/pipewire/"
cp "${SCRIPT_DIR}/../../etc/pipewire/pipewire-input-filter-chain.service" \
    "${HOME}/.config/systemd/user/"
sed -i "s/placeholderusername/$(whoami)/" \
    "${HOME}/.config/systemd/user/pipewire-input-filter-chain.service"
systemctl daemon-reload --user
systemctl enable --user --now pipewire-input-filter-chain.service
