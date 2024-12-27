#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install microsoft GPG key for VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Configure VSCode rpm repository
sudo cp "${SCRIPT_DIR}/../../etc/yum/vscode.repo" "/etc/yum.repos.d/vscode.repo"
