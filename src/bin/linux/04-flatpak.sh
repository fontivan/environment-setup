#!/usr/bin/env bash

# Add flatpak repo
flatpak remote-add \
    --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update everything
sudo flatpak update -y

MANGOHUD_BRANCH="26.08"
GAMESCOPE_BRANCH="26.08"

# Install flatpaks
sudo flatpak install -y flathub \
    "com.adamcake.Bolt" \
    "com.discordapp.Discord" \
    "com.github.tchx84.Flatseal" \
    "com.spotify.Client" \
    "net.davidotek.pupgui2" \
    "org.freedesktop.Platform.VulkanLayer.MangoHud//${MANGOHUD_BRANCH}" \
    "org.freedesktop.Platform.VulkanLayer.gamescope//${GAMESCOPE_BRANCH}" || exit 1

sudo flatpak install -y fedora "org.rncbc.qjackctl" || exit 1

FLATPAK_ARCH="$(flatpak --default-arch)" || exit 1
SYSTEM_RUNTIME_REFS="$(sudo flatpak list --system --runtime --arch="${FLATPAK_ARCH}" --columns=ref)" || exit 1

uninstall_runtime_ref() {
    local ref="$1"

    sudo flatpak uninstall --system --runtime --no-related --assumeyes "${ref}" || {
        printf 'Failed to remove old Flatpak runtime: %s\n' "${ref}" >&2
        return 1
    }
}

prune_runtime_branches() {
    local app_id="$1"
    local keep_branch="$2"
    local ref

    while IFS= read -r ref; do
        [[ "${ref%%/*}" == "${app_id}" ]] || continue
        [[ "${ref##*/}" == "${keep_branch}" ]] && continue
        uninstall_runtime_ref "${ref}" || return 1
    done <<< "${SYSTEM_RUNTIME_REFS}"
}

prune_runtime_to_latest_branch() {
    local app_id="$1"
    local refs=()
    local ref
    local latest_ref

    while IFS= read -r ref; do
        [[ "${ref%%/*}" == "${app_id}" ]] && refs+=("${ref}")
    done <<< "${SYSTEM_RUNTIME_REFS}"

    ((${#refs[@]} > 1)) || return 0
    latest_ref="$(printf '%s\n' "${refs[@]}" | sort -V | tail -n 1)" || return 1

    for ref in "${refs[@]}"; do
        [[ "${ref}" == "${latest_ref}" ]] && continue
        uninstall_runtime_ref "${ref}" || return 1
    done
}

prune_nvidia_gl_drivers() {
    local refs=()
    local ref
    local latest_ref

    while IFS= read -r ref; do
        [[ "${ref%%/*}" == org.freedesktop.Platform.GL.nvidia-* ]] && refs+=("${ref}")
    done <<< "${SYSTEM_RUNTIME_REFS}"

    ((${#refs[@]} > 1)) || return 0
    latest_ref="$(printf '%s\n' "${refs[@]}" | sort -V | tail -n 1)" || return 1

    for ref in "${refs[@]}"; do
        [[ "${ref}" == "${latest_ref}" ]] && continue
        uninstall_runtime_ref "${ref}" || return 1
    done
}

prune_runtime_branches "org.freedesktop.Platform.VulkanLayer.MangoHud" "${MANGOHUD_BRANCH}" || exit 1
prune_runtime_branches "org.freedesktop.Platform.VulkanLayer.gamescope" "${GAMESCOPE_BRANCH}" || exit 1
prune_nvidia_gl_drivers || exit 1
prune_runtime_to_latest_branch "org.freedesktop.Platform.VAAPI.nvidia" || exit 1
prune_runtime_to_latest_branch "org.fedoraproject.Platform.VAAPI.nvidia" || exit 1

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
