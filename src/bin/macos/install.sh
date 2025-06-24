#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/01-xcode.sh
"${SCRIPT_DIR}"/02-brew.sh
"${SCRIPT_DIR}"/03-zsh.sh
"${SCRIPT_DIR}"/04-kubectl.sh
"${SCRIPT_DIR}"/05-opm.sh
"${SCRIPT_DIR}"/06-podman.sh
"${SCRIPT_DIR}"/07-gpg-agent.sh
"${SCRIPT_DIR}"/../common/01-sanitize.sh
"${SCRIPT_DIR}"/../common/02-rust.sh
"${SCRIPT_DIR}"/../common/03-kustomize.sh
