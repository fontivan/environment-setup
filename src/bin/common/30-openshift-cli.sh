#!/usr/bin/env bash

# Install oc and kubectl
mkdir -p /tmp/oc/
curl -o /tmp/oc/oc.tar.gz -L https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz && \
tar -xvf /tmp/oc/oc.tar.gz -C /tmp/oc && \
sudo mv /tmp/oc/oc /usr/local/bin/oc && \
sudo chmod +x /usr/local/bin/oc && \
sudo mv /tmp/oc/kubectl /usr/local/bin/kubectl && \
sudo chmod +x /usr/local/bin/kubectl && \
rm -rf /tmp/oc
