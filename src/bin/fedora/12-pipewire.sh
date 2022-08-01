#!/usr/bin/env bash

# Install pipewire configuration and systemd service to run it automatically
mkdir -p ~/.config/pipewire ~/.config/systemd/user
cp ../../etc/pipewire/pipewire-input-filter-chain.conf ~/.config/pipewire/
cp ../../etc/pipewire/pipewire-input-filter-chain.service ~/.config/systemd/user/
sed -i "s/placeholderusername/$(whoami)/" ~/.config/systemd/user/pipewire-input-filter-chain.service
systemctl daemon-reload --user
systemctl enable --user --now pipewire-input-filter-chain.service
