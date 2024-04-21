#!/usr/bin/env bash

# bashate disable=e006
URL="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Install rpm fusion non free repo
sudo dnf install -y "${URL}"
