#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install insync rpm key
sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key

# Install insync repo
sudo cp "${SCRIPT_DIR}/../../etc/yum/insync.repo" "/etc/yum.repos.d/insync.repo"
