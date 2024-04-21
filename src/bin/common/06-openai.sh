#!/usr/bin/env bash

URL="https://raw.githubusercontent.com/fontivan/chatGPT-shell-cli/main/chatgpt.sh"

sudo curl -sS "${URL}" -o "/usr/local/bin/chatgpt"
sudo chmod +x "/usr/local/bin/chatgpt"
