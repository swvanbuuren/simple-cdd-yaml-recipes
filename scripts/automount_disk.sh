#!/bin/sh
UUID={{uuid}}
MOUNT_POINT={{mount_point}}
mkdir -p $MOUNT_POINT
echo "UUID=${UUID}       ${MOUNT_POINT}            ext4    defaults,errors=remount-ro,nofail       0       1" >> /etc/fstab
