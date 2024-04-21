#!/usr/bin/env bash

URL_FREE="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
URL_NONFREE="https://download1.rpmfusion.org/free/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Install rpm fusion free repo
sudo dnf install -y "${URL_FREE}"

sudo dnf install -y "${URL_NONFREE}"
