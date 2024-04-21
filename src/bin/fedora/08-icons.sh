#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install desktop icons
cp "${SCRIPT_DIR}"/../../etc/icons/*.desktop \
    "/home/$(whoami)/.local/share/applications"
