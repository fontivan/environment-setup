#!/usr/bin/env bash

URL="https://github.com/fontivan/fedora-wayland-nvidia-suspend-fix.git"
SCRIPT="./fedora-wayland-nvidia-suspend-fix/src/fedora-wayland-nvidia-suspend-fix.sh"

# Check for NVIDIA gpu
if [[ $(lspci | grep 'NVIDIA' | grep -c 'VGA') -gt 0 ]]; then
    sudo dnf install -y \
        "akmod-nvidia" \
        "libva-nvidia-driver" \
        "nvidia-settings" \
        "xorg-x11-drv-nvidia-cuda" \
        "xorg-x11-drv-nvidia-power"
fi

# Check for AMD gpu
if [[ $(lspci | grep 'AMD' | grep -c 'VGA' ) -gt 0 ]]; then
    sudo dnf install xorg-x11-drv-amdgpu -y
fi
