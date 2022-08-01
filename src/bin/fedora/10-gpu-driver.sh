#!/usr/bin/env bash

# Check for NVIDIA gpu
if [[ $(lspci | grep 'NVIDIA' | grep 'VGA' | wc -l) -gt 0 ]]
then
    sudo dnf install akmod-nvidia -y
    sudo dnf install xorg-x11-drv-nvidia-cuda -y

    # Install wayland suspend workarounds
    (
        cd /tmp
        git clone https://github.com/fontivan/fedora-wayland-nvidia-suspend-fix.git
        ./fedora-wayland-nvidia-suspend-fix/src/fedora-wayland-nvidia-suspend-fix.sh i
        rm -rf ./fedora-wayland-nvidia-suspend-fix/
    )
fi

# Check for AMD gpu
if [[ $(lspci | grep 'AMD' | grep 'VGA' | wc -l) -gt 0 ]]
then
    sudo dnf install xorg-x11-drv-amdgpu -y
fi