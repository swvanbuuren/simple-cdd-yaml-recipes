#!/bin/sh
mkdir -p /etc/apt/keyrings
gpg --homedir /tmp --no-default-keyring --keyring /tmp/dummy.gpg --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
gpg --no-default-keyring --keyring /tmp/dummy.gpg --export > /etc/apt/keyrings/ubuntu-archives-2018.gpg 
echo "deb [ signed-by=/etc/apt/keyrings/ubuntu-archives-2018.gpg ] http://archive.ubuntu.com/ubuntu focal-updates main" \
    | tee /etc/apt/sources.list.d/ubuntu-archives.list
cat > /etc/apt/preferences.d/99focal-updates << EOL
Package: firefox*
Pin: release a=focal-updates
Pin-Priority: 500

Package: *
Pin: release a=focal-updates
Pin-Priority: 1
EOL
apt-get -y update
apt-get install --no-install-recommends -y firefox
