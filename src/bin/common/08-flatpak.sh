#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add \
    --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y

# Install flatpaks
sudo flatpak install -y flathub \
    "com.adamcake.Bolt" \
    "com.discordapp.Discord" \
    "com.github.tchx84.Flatseal" \
    "com.spotify.Client" \
    "dev.vencord.Vesktop" \
    "net.davidotek.pupgui2" \
    "net.lutris.Lutris" \
    "org.freedesktop.Platform.VulkanLayer.MangoHud//23.08"
