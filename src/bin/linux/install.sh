#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/../common/install.sh

"${SCRIPT_DIR}"/01-hostname.sh
"${SCRIPT_DIR}"/02-zsh.sh
"${SCRIPT_DIR}"/03-ollama.sh
"${SCRIPT_DIR}"/04-flatpak.sh
"${SCRIPT_DIR}"/05-rnnoise.sh
"${SCRIPT_DIR}"/06-gnome-extensions.sh
"${SCRIPT_DIR}"/07-openshift-cli.sh
"${SCRIPT_DIR}"/08-opm.sh
"${SCRIPT_DIR}"/09-yubico-authenticator.sh
