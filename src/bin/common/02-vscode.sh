#!/usr/bin/env bash

# Install VSCode extensions
VSCODE_EXTENSIONS=(
    esbenp.prettier-vscode
    mohsen1.prettify-json
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-vscode.live-server
    redhat.java
    redhat.vscode-yaml
    VisualStudioExptTeam.vscodeintellicode
    vscjava.vscode-java-debug
    vscjava.vscode-java-dependency
    vscjava.vscode-java-pack
    vscjava.vscode-java-test
    vscjava.vscode-maven
)

for EXTENSION in "${VSCODE_EXTENSIONS[@]}"; do
    code --install-extension "${EXTENSION}"
done
