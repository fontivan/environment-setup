#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

sudo dnf install clamav clamd clamav-freshclam

sudo cp $DIR/../../etc/clam/clamd.service /etc/systemd/system/clamd.service

sudo systemctl daemon-reload

sudo systemctl enable clamav-freshclam
sudo systemctl start clamav-freshclam

sudo systemctl enable clamd@scan
sudo systemctl start clamd@scan

sudo setsebool antivirus_can_scan_system on
sudo setsebool antivirus_can_use_jit on
