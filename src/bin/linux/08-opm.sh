#!/usr/bin/env bash

# Install opm
mkdir -p /tmp/opm/
curl -o /tmp/opm/opm-linux.tar.gz -L https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/latest/opm-linux.tar.gz && \
tar -xvf /tmp/opm/opm-linux.tar.gz -C /tmp/opm && \
sudo mv /tmp/opm/opm-rhel8 /usr/local/bin/opm && \
sudo chmod +x /usr/local/bin/opm && \
rm -rf /tmp/opm
