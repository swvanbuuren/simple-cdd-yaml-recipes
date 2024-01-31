#!/bin/sh
wget https://github.com/jitsi/jitsi-meet-electron/releases/latest/download/jitsi-meet-amd64.deb
sudo apt-get install -y ./jitsi-meet-amd64.deb
rm -rf ./jitsi-meet-amd64.deb
