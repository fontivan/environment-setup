#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"${SCRIPT_DIR}"/01-cpu-x.sh
"${SCRIPT_DIR}"/02-yubico.sh
"${SCRIPT_DIR}"/03-wootility.sh
"${SCRIPT_DIR}"/04-r2modman.sh
"${SCRIPT_DIR}"/10-curseforge.sh
"${SCRIPT_DIR}"/11-wcl.sh
"${SCRIPT_DIR}"/12-ascension.sh
"${SCRIPT_DIR}"/13-wowup.sh
"${SCRIPT_DIR}"/14-weakauras.sh
"${SCRIPT_DIR}"/20-exiled-exchange.sh
