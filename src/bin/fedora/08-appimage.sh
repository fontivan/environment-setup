#!/usr/bin/env bash

# Install appimages
sudo mkdir /opt/appimages

# Install curseforge client
(
    cd /tmp
    sudo curl -L -o /opt/appimages/curseforge-latest.zip https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip
    unzip curseforge-latest.zip
    sudo mv CurseForge*.AppImage /opt/appimages/curseforge-latest.appimage
    rm curseforge-latest.zip
)

# Warcraft logs client
sudo curl -L -o /opt/appimages/warcraftlogs-latest.appimage https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v5.9.0/Warcraft-Logs-Uploader-5.9.0.AppImage

# RuneLite client
sudo curl -L -o /opt/appimages/runelite-latest.appimage https://github.com/runelite/launcher/releases/download/2.4.2/RuneLite.AppImage

# Webcord client
sudo curl -L -o /opt/appimages/webcord-latest.appimage https://github.com/SpacingBat3/WebCord/releases/download/v3.6.0/WebCord-3.6.0-x64.AppImage

# Set chmod for all appimages
sudo chmod +x /opt/appimages/*.appimage

# Set owner for all images
sudo chown -R root:root /opt/appimages/
