#!/bin/sh
LIGHTDM_DIR="/etc/lightdm/lightdm.conf.d"
mkdir -p $LIGHTDM_DIR
cat > ${LIGHTDM_DIR}/autologin.conf << EOL
[Seat:*]
user-session=xfce
autologin-user={{username}}
autologin-user-timeout=0
EOL
