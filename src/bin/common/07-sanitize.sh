#!/usr/bin/env bash

URL="https://raw.githubusercontent.com/fontivan/sanitize/main/src/bin/sanitize"

sudo curl -sS "${URL}" -o "/usr/local/bin/sanitize"
sudo chmod +x "/usr/local/bin/sanitize"
