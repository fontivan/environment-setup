#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/01-brew.sh
"${SCRIPT_DIR}"/02-xcode.sh
"${SCRIPT_DIR}"/03-zsh.sh
"${SCRIPT_DIR}"/04-kubectl.sh
"${SCRIPT_DIR}"/05-opm.sh
"${SCRIPT_DIR}"/06-podman.sh
"${SCRIPT_DIR}"/../common/01-sanitize.sh
"${SCRIPT_DIR}"/../common/02-rust.sh
