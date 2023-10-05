#!/bin/sh

USER="{{username}}"
DEFGROUPS="admin,adm,dialout,cdrom,plugdev,power,audio,dip,video,staff,shared,sudo"

echo "Creating new user called '$USER'"
adduser --gecos "$USER" \
	--disabled-password \
	--shell /bin/bash \
	"$USER"
echo "$USER:$USER" | chpasswd

for group in $(echo $DEFGROUPS | tr ',' ' '); do
    if /bin/egrep  -i "^$group" /etc/group ; then
       echo "Group $group exists in /etc/group"
    else
       echo "Group $group does not exist in /etc/group, creating"
       groupadd $group
    fi
done

echo "Add $USER to ($DEFGROUPS) groups"
usermod -a -G ${DEFGROUPS} ${USER}
