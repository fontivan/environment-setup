#!/usr/bin/env bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

sudo dnf install -y clamav clamd clamav-freshclam

sudo cp $DIR/../../etc/clam/clamdscan.cron /etc/cron.d/clamdscan
sudo cp $DIR/../../etc/clam/scan.conf /etc/clamd.d/scan.conf
sudo cp $DIR/../../etc/clam/freshclam.conf /etc/freshclam.conf

sudo systemctl daemon-reload

sudo systemctl enable clamav-freshclam
sudo systemctl start clamav-freshclam

sudo systemctl enable clamd@scan
sudo systemctl start clamd@scan

sudo setsebool antivirus_can_scan_system on
sudo setsebool antivirus_use_jit on

