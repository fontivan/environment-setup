#!/usr/bin/env bash

# Install microsoft GPG key for VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Configure VSCode rpm repository
sudo bash -c 'echo """
[vscode]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
""" > /etc/yum.repos.d/vscode.repo'
