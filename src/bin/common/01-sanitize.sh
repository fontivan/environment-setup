#!/usr/bin/env bash

set -euo pipefail

URL="https://raw.githubusercontent.com/fontivan/sanitize/main/src/bin/sanitize"
SANITIZE_PATH="/usr/local/bin/sanitize"
TMP_PATH=$(mktemp)

trap 'rm -f -- "${TMP_PATH}"' EXIT

curl -fsSL "${URL}" -o "${TMP_PATH}"
sudo install -m 755 "${TMP_PATH}" "${SANITIZE_PATH}"
