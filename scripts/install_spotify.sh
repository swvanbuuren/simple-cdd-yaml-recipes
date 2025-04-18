#!/bin/sh
mkdir -p /etc/apt/keyrings
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg \
    | gpg --dearmor --yes -o /etc/apt/keyrings/spotify.gpg
echo "deb [ signed-by=/etc/apt/keyrings/spotify.gpg ] https://repository.spotify.com stable non-free" \
    | tee /etc/apt/sources.list.d/spotify.list
apt-get -y update
apt-get install --no-install-recommends -y spotify-client
