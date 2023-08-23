#!/bin/sh
grub2default=/etc/default/grub
if [ -f "$grub2default" ]; then
    # remove keywords from CMDLINE_LINUX_DEFAULT
    sed -i '/CMDLINE_LINUX_DEFAULT/c\CMDLINE_LINUX_DEFAULT=""' $grub2default
    # set timeout to zero
    sed -i '/GRUB_TIMEOUT/c\GRUB_TIMEOUT=0' $grub2default
    # ensure the updates go live
    update-grub
fi
