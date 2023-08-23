#!/bin/sh
mkdir -p /etc/apt/keyrings
curl -sS https://repo.skype.com/data/SKYPE-GPG-KEY \
     | gpg --dearmor --yes -o /etc/apt/keyrings/skype-stable.gpg
echo "deb [ arch=amd64, signed-by=/etc/apt/keyrings/skype-stable.gpg ] https://repo.skype.com/deb stable main" \
    | tee /etc/apt/sources.list.d/skype-stable.list
apt-get -y update
apt-get install --no-install-recommends -y skypeforlinux
