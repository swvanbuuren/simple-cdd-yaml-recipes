#!/bin/sh
USER={{username}}
apt-get -y update
apt-get install --no-install-recommends -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo -H -u ${USER} flatpak install flathub com.skype.Client
