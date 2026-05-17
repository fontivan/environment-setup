#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add \
    --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y
