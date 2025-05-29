#!/usr/bin/env bash

sudo curl -L -o /usr/local/bin/kubectl  "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl" && \
sudo chmod +x /usr/local/bin/kubectl
