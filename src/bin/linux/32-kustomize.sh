#!/usr/bin/env bash

# Install kustomize
curl -o /tmp/install_kustomize.sh -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" && \
chmod +x /tmp/install_kustomize.sh && \
sudo /tmp/install_kustomize.sh /usr/local/bin/ && \
sudo chmod +x /usr/local/bin/kustomize && \
rm /tmp/install_kustomize.sh
