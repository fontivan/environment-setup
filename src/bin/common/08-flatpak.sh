#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y

# Install flatpaks
sudo flatpak install flathub \
    "com.axosoft.GitKraken" \
    "com.discordapp.Discord" \
    "com.jetbrains.IntelliJ-IDEA-Community" \
    "com.spotify.Client" \
    "net.lutris.Lutris
