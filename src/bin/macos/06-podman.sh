#!/usr/bin/env bash

CLONE_PATH="/Users/$(whoami)/git/github.com/fontivan"

(
    if [[ ! -d "${CLONE_PATH}" ]]; then
        mkdir -p "${CLONE_PATH}"
        cd "${CLONE_PATH}" || exit
        git clone https://github.com/fontivan/macos-virtualized-linux-env.git
    fi
    ./macos-virtualized-linux-env/common/setup.sh
)
