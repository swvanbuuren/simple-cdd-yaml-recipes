#!/bin/sh
USERNAME={{username}}
groupadd -r autologin
gpasswd -a $USERNAME autologin
LIGHTDM_DIR="/etc/lightdm/lightdm.conf.d"
mkdir -p $LIGHTDM_DIR
cat > ${LIGHTDM_DIR}/autologin.conf << EOL
[Seat:*]
user-session=xfce
autologin-user=$USERNAME
autologin-user-timeout=0
autologin-session=xfce
EOL
