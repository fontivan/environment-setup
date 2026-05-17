#!/usr/bin/env bash

# Download and install ollama using their install script
# This will also install the systemd service and AMD/NVIDIA acceleration
curl -fsSL https://ollama.com/install.sh | sh

# Download the llama3 model since it is currently very powerful and freely available
ollama pull llama3
