#!/usr/bin/env bash

set -euo pipefail

VERSION="v1.10"

URL="https://github.com/werman/noise-suppression-for-voice/releases/download/${VERSION}/linux-rnnoise.zip"
TMP_PATH=$(mktemp -d)
RNNOISE_PATH="${HOME}/.local/opt/linux-rnnoise"
PIPEWIRE_DROPIN_PATH="${HOME}/.config/systemd/user/pipewire.service.d/10-rnnoise.conf"

trap 'rm -rf -- "${TMP_PATH}"' EXIT

curl -fL -o "${TMP_PATH}/linux-rnnoise.zip" "${URL}"
unzip -q "${TMP_PATH}/linux-rnnoise.zip" -d "${TMP_PATH}"

if [[ ! -f "${TMP_PATH}/linux-rnnoise/ladspa/librnnoise_ladspa.so" ]]; then
    printf 'RNNoise LADSPA plugin not found in downloaded archive\n' >&2
    exit 1
fi

mkdir -p "$(dirname "${RNNOISE_PATH}")"
rm -rf -- "${RNNOISE_PATH}"
mkdir -p "${RNNOISE_PATH}"
cp -R "${TMP_PATH}/linux-rnnoise/." "${RNNOISE_PATH}/"

mkdir -p "$(dirname "${PIPEWIRE_DROPIN_PATH}")"
cat > "${PIPEWIRE_DROPIN_PATH}" <<'EOF'
[Service]
Environment="LADSPA_PATH=%h/.local/opt/linux-rnnoise/ladspa:/usr/lib64/ladspa:/usr/lib/ladspa:/usr/local/lib/ladspa"
EOF

systemctl --user daemon-reload
systemctl --user restart pipewire.service
