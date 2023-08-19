#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install desktop icons
cp $DIR/../../etc/icons/*.desktop /home/$(whoami)/.local/share/applications
