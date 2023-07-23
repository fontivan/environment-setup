#!/usr/bin/env bash

# versions
CURSEFORGE_VERSION="latest"
WARCRAFTLOGS_VERSION="6.0.2"
RUNELITE_VERSION="2.6.7"
WEBCORD_VERSION="4.3.0"
ASCENSION_VERSION="113"
RTWOMODMAN_VERSION="3.1.42"
WEAKAURAS_VERSION="5.0.1"
WOOTILITY_VERSION="4.5.5"

# Install appimages
sudo mkdir -p /opt/appimages

# Install curseforge client
(
    if [[ -f "/tmp/curseforge" ]]; then
        rm -rf /tmp/curseforge
    fi
    mkdir -p /tmp/curseforge
    cd /tmp/curseforge
    sudo curl -L -o curseforge-latest.zip https://curseforge.overwolf.com/downloads/curseforge-${CURSEFORGE_VERSION}-linux.zip
    unzip curseforge-latest.zip
    sudo mv CurseForge*.AppImage /opt/appimages/curseforge-latest.appimage
    cd /tmp
    rm -rf /tmp/curseforge
)

# Warcraft logs client
sudo curl -L -o /opt/appimages/warcraftlogs-latest.appimage https://github.com/RPGLogs/Uploaders-warcraftlogs/releases/download/v${WARCRAFTLOGS_VERSION}/Warcraft-Logs-Uploader-${WARCRAFTLOGS_VERSION}.AppImage

# RuneLite client
sudo curl -L -o /opt/appimages/runelite-latest.appimage https://github.com/runelite/launcher/releases/download/${RUNELITE_VERSION}/RuneLite.AppImage

# Webcord client
sudo curl -L -o /opt/appimages/webcord-latest.appimage https://github.com/SpacingBat3/WebCord/releases/download/v${WEBCORD_VERSION}/WebCord-${WEBCORD_VERSION}-x64.AppImage

# Ascension launcher
sudo curl -L -o /opt/appimages/ascension-launcher-latest.appimage https://download.ascension-patch.gg/update/ascension-launcher-${ASCENSION_VERSION}.AppImage

# r2modman launcher
(
    if [[ -f "/tmp/r2modman" ]]; then
        rm -rf /tmp/r2modman
    fi
    mkdir -p /tmp/r2modman
    cd /tmp/r2modman
    sudo curl -L -o r2modman-latest.zip https://gcdn.thunderstore.io/live/repository/packages/ebkr-r2modman-${RTWOMODMAN_VERSION}.zip
    unzip r2modman-latest.zip
    sudo mv r2modman-*.AppImage /opt/appimages/r2modman-latest.appimage
    cd /tmp
    rm -rf /tmp/r2modman
)

# Weakauras client
sudo curl -L -o /opt/appimages/weakauras-client-latest.appimage https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v${WEAKAURAS_VERSION}/WeakAuras-Companion-${WEAKAURAS_VERSION}.AppImage

# wootility
sudo curl -L -o /opt/appimages.wootility.appimage https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-latest/wootility-lekker-${WOOTILITY_VERSION}.AppImage

# Set chmod for all appimages
sudo chmod +x /opt/appimages/*.appimage

# Set owner for all images
sudo chown -R root:root /opt/appimages/
