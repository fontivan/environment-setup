#!/usr/bin/env bash

# Update list of DNF packages
sudo dnf update -y

# Update everything
sudo dnf upgrade -y

# Autoremove
sudo dnf autoremove -y

# Install groups
sudo dnf -y groupinstall "Development Tools"

# Install packages
sudo dnf install -y \
    "code" \
    "cronie" \
    "cronie-anacron" \
    "dbus-libs.i686" \
    "dnf-plugins-core" \
    "expect" \
    "freetype.i686" \
    "gamescope" \
    "gnome-tweaks" \
    "gnutls.i686" \
    "htop" \
    "insync" \
    "ladspa" \
    "libgcrypt.i686" \
    "libgcrypt.x86_64" \
    "libgpg-error.i686" \
    "libxml2.i686" \
    "openldap.i686" \
    "qjackctl" \
    "rsnapshot" \
    "rsync" \
    "rust" \
    "SDL2.i686" \
    "snapd" \
    "sqlite2.i686" \
    "steam" \
    "tlp" \
    "util-linux-user" \
    "wine" \
    "zsh" \
    "GConf2"
