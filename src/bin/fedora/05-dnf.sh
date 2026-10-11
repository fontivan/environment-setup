#!/usr/bin/env bash

# Update list of DNF packages
sudo dnf update -y

# Update everything
sudo dnf upgrade -y

# Autoremove
sudo dnf autoremove -y

# Enable Chrome repository
sudo dnf config-manager setopt google-chrome.enabled=1

# Install groups
sudo dnf -y groupinstall "Development Tools"

# Install packages
sudo dnf install -y \
    "code" \
    "cronie-anacron" \
    "cronie" \
    "dbus-libs.i686" \
    "dnf-plugins-core" \
    "expect" \
    "freetype.i686" \
    "gamescope" \
    "gnome-tweaks" \
    "gnutls.i686" \
    "google-chrome-stable" \
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

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/microsoft-edge-stable-wayland.desktop" <<'EOF'
[Desktop Entry]
Name=Microsoft Edge (Wayland)
Exec=/usr/bin/microsoft-edge-stable --enable-features=UseOzonePlatform --ozone-platform=wayland %U
Icon=/usr/share/icons/hicolor/128x128/apps/microsoft-edge.png
Type=Application
Categories=Network;WebBrowser;
EOF
cat > "${APPLICATIONS_PATH}/vscode-wayland.desktop" <<'EOF'
[Desktop Entry]
Name=VSCode (Wayland)
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/usr/share/code/code --ozone-platform=wayland --ozone-platform-hint=auto --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer --unity-launch %F
Icon=vscode
Type=Application
StartupNotify=false
StartupWMClass=Code
Categories=TextEditor;Development;IDE;
MimeType=text/plain;inode/directory;application/x-code-workspace;
Actions=new-empty-window;
Keywords=vscode;

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=/usr/share/code/code --ozone-platform=wayland --ozone-platform-hint=auto --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer --new-window %F
Icon=vscode
EOF
