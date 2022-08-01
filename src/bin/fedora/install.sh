#!/usr/bin/env bash

./01-fusion-free-repo.sh
./02-fusion-nonfree-repo.sh
./03-vscode-repo.sh
./04-insync-repo.sh
./05-dnf.sh
./06-snap.sh
./07-flatpak.sh
./08-appimage.sh
./09-gpu-driver.sh
./10-icons.sh
./11-rnnoise.sh
./12-pipewire.sh

../common/install.sh
