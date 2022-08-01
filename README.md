# environment-setup
A set of scripts to configure some simple things on a freshly installed environment

This is only really tested on Fedora. However it should be enough to get a very usable desktop setup when run on top of a fresh Fedora installation.

This handles quite a few things;
1. Installing extra repositories for fusion (nonfree & free), vscode, insync, flatpak, etc
2. Install a ton of useful packages (see individual installation scripts for full list)
3. Install gpu drivers (include wayland suspend workarounds for nvidia)
4. Install some custom desktop icons for launching applications
5. Install rnnoise and configure pipewire to create a noise filtered mic
6. Configure the system hostname
7. Configure vscode extensions
8. Install zsh and shell color theme
9. Install rust via rustup
