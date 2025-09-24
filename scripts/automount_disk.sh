#!/bin/sh
UUID={{uuid}}
MOUNT_POINT={{mount_point}}
DISK_TYPE={{ disk_type | default("ext4") }}

mkdir -p $MOUNT_POINT

case "$DISK_TYPE" in
    ext4)
        fstype="ext4"
        mount_opts="defaults,errors=remount-ro,nofail"
        dump=0
        pass=1
        ;;
    ntfs)
        fstype="ntfs-3g"
        mount_opts="rw,uid=1000,gid=1000,dmask=0002,fmask=0003"
        dump=0
        pass=0
        ;;

echo "UUID=${UUID}       ${MOUNT_POINT}            ${fstype}    ${mount_opts}       ${dump}       ${pass}" >> /etc/fstab
