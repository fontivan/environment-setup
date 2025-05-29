#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/01-hostname.sh
"${SCRIPT_DIR}"/03-zsh.sh
"${SCRIPT_DIR}"/05-rust.sh
"${SCRIPT_DIR}"/06-ollama.sh
"${SCRIPT_DIR}"/08-flatpak.sh
"${SCRIPT_DIR}"/09-snap.sh
"${SCRIPT_DIR}"/10-rnnoise.sh
"${SCRIPT_DIR}"/11-gnome-extensions.sh
"${SCRIPT_DIR}"/12-yubico-authenticator.sh
"${SCRIPT_DIR}"/13-curseforge.sh
"${SCRIPT_DIR}"/14-wcl.sh
"${SCRIPT_DIR}"/15-ascension.sh
"${SCRIPT_DIR}"/16-wowup.sh
"${SCRIPT_DIR}"/17-r2modman.sh
"${SCRIPT_DIR}"/18-weakauras.sh
"${SCRIPT_DIR}"/19-wootility.sh
"${SCRIPT_DIR}"/20-yubico.sh
"${SCRIPT_DIR}"/21-exiled-exchange.sh
"${SCRIPT_DIR}"/22-cpu-x.sh
"${SCRIPT_DIR}"/30-openshift-cli.sh
"${SCRIPT_DIR}"/31-opm.sh
"${SCRIPT_DIR}"/32-kustomize.sh
"${SCRIPT_DIR}"/../common/01-sanitize.sh
"${SCRIPT_DIR}"/../common/02-rust.sh
