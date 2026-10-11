#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add \
    --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y

APPLICATIONS_PATH="${HOME}/.local/share/applications"
mkdir -p "${APPLICATIONS_PATH}"
cat > "${APPLICATIONS_PATH}/discord-wayland.desktop" <<'EOF'
[Desktop Entry]
Name=Discord (Wayland)
Comment=Discord Client (Wayland)
GenericName=Discord
Exec=flatpak run com.discordapp.Discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy --enable-features=VaapiIgnoreDriverChecks --enable-features=WaylandWindowDecorations --disable-features=UseChromeOSDirectVideoDecoder --enable-native-gpu-memory-buffers
Type=Application
StartupNotify=false
StartupWMClass=Discord
Icon=com.discordapp.Discord
EOF
cat > "${APPLICATIONS_PATH}/spotify.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Spotify (Wayland)
GenericName=Music Player
Icon=com.spotify.Client
Exec=/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=spotify --file-forwarding com.spotify.Client --ozone-platform=wayland --disable-features=WaylandWindowDecorations @@u %U @@
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify
X-GNOME-UsesNotifications=true
X-Flatpak-Tags=proprietary;
X-Flatpak=com.spotify.Client
EOF
