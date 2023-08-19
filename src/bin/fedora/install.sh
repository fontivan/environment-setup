#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

$DIR/../common/install.sh

$DIR/01-fusion-free-repo.sh
$DIR/02-fusion-nonfree-repo.sh
$DIR/03-vscode-repo.sh
$DIR/04-insync-repo.sh
$DIR/05-dnf.sh
$DIR/06-snap.sh
$DIR/07-gpu-driver.sh
$DIR/08-icons.sh
$DIR/09-pipewire.sh
