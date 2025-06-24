#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

HOME_DIR="/Users/$(whoami)"

# Copy files
cp "${SCRIPT_DIR}/../../etc/gpg/gpg.conf" "${HOME_DIR}/.gnupg/gpg.conf"
cp "${SCRIPT_DIR}/../../etc/gpg/gpg-agent.conf" "${HOME_DIR}/.gnupg/gpg-agent.conf"

# Make a backup
cp "${HOME_DIR}/.zshrc" "${HOME_DIR}/.zshrc.old.$(gdate +%s.%N)"

# Strip any gpg lines out
grep -vi 'gpg' < "${HOME_DIR}/.zshrc" | sponge "${HOME_DIR}/.zshrc"

# Add new gpg lines
echo "export GPG_TTY=\$(tty)" >> "${HOME_DIR}/.zshrc"
echo "gpgconf --launch gpg-agent" >> "${HOME_DIR}/.zshrc"
