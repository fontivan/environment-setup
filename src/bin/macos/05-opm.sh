#!/usr/bin/env bash

(
    curl -o /tmp/opm-mac.tar.gz https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/opm-mac.tar.gz && \
    cd /tmp/ && \
    tar -xzvf opm-mac.tar.gz && \
    sudo mv /tmp/darwin-amd64-opm /usr/local/bin/opm && \
    sudo chmod +x /usr/local/bin/opm
)
