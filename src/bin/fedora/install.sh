#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/../common/install.sh

"${SCRIPT_DIR}"/01-fusion-free-repo.sh
"${SCRIPT_DIR}"/02-fusion-nonfree-repo.sh
"${SCRIPT_DIR}"/03-vscode-repo.sh
"${SCRIPT_DIR}"/04-insync-repo.sh
"${SCRIPT_DIR}"/05-dnf.sh
"${SCRIPT_DIR}"/06-snap.sh
"${SCRIPT_DIR}"/07-gpu-driver.sh
"${SCRIPT_DIR}"/08-icons.sh
"${SCRIPT_DIR}"/09-pipewire.sh
"${SCRIPT_DIR}"/11-clam.sh
