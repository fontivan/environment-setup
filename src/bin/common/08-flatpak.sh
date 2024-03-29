#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y

# Install flatpaks
sudo flatpak install -y flathub \
    "com.discordapp.Discord" \
    "com.github.tchx84.Flatseal" \
    "com.spotify.Client" \
    "net.davidotek.pupgui2" \
    "net.lutris.Lutris" \
    "org.freedesktop.Platform.VulkanLayer.MangoHud//22.08"
