#!/bin/sh
mkdir -p /etc/X11/xorg.conf.d
cat > /etc/X11/xorg.conf.d/20-intel.conf << EOL
Section "Device"
    Identifier "Intel Graphics"
    Driver "Intel"
    Option "TearFree" "true"
EndSection
EOL
apt-get -y update
apt-get install --no-install-recommends -y xserver-xorg-video-intel
