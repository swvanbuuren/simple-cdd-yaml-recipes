#!/bin/sh
# Define global variables
ROUTER_IP={{router_ip}}
SERVER_IP={{server_ip}}
CLIENT_IP={{client_ip}}
SERVER_NAME={{server_name}}
CLIENT_NAME={{client_name}}
MOUNT_POINTS="{{mount_points}}"
# Install required packages
apt-get install --no-install-recommends -y ufw nfs-common openssh-server openssh-client
# Firewall settings
ufw allow from "${SERVER_IP}" to any port 111
ufw allow from "${SERVER_IP}" to any port 2049
ufw allow from "${SERVER_IP}" to any port 13025
ufw allow from "${SERVER_IP}" to any port 22
# Append to /etc/hosts
echo "${ROUTER_IP}    router" >> /etc/hosts
echo "${SERVER_IP}    ${SERVER_NAME}" >> /etc/hosts
for mount_point in $MOUNT_POINTS; do
    # create mount points
    mkdir -p /mnt/nas/${mount_point}
    # modify /etc/fstab
    echo "${SERVER_IP}:/mnt/${mount_point} /mnt/nas/${mount_point} nfs auto,rw,users,noatime,nolock,actimeo=1800 0 0" >> /etc/fstab
done
