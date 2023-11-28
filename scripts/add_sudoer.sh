#!/bin/bash
USERNAME={{username}}
/usr/sbin/usermod -a -G sudo $USERNAME
mkdir -p /etc/sudoers.d
echo "$USERNAME	ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME
