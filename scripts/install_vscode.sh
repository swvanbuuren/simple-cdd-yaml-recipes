#!/bin/sh
apt-get install --no-install-recommends -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    | tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt-get install --no-install-recommends -y apt-transport-https
sudo apt-get -y update
sudo apt-get install --no-install-recommends -y code
