#!/bin/sh
apt-get update
apt-get install --no-install-recommends -y qt5-gtk-platformtheme
# see https://forums.bunsenlabs.org/viewtopic.php?id=9322&p=4
wget https://download.opensuse.org/repositories/home:/unit193/Debian_13/amd64/qt5gtk2_1.0-0vanir1_amd64.deb
apt-get install -y ./qt5gtk2_1.0-0vanir1_amd64.deb
touch $HOME/.xsessionrc
echo "# Qt should respect platform theme" >> $HOME/.xsessionrc
echo "export QT_QPA_PLATFORMTHEME=qt5gtk2" >> $HOME/.xsessionrc
EOF
