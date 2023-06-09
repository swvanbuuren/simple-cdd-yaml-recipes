#!/bin/sh
mkdir -p /etc/apt/keyrings
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/etc/apt/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/etc/apt/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
apt-get -y update
apt-get install --no-install-recommends -y codium
