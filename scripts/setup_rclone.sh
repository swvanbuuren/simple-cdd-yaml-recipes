#!/bin/sh
USERNAME={{username}}
GDRIVE_USER={{gdrive_user}}
apt-get -y upate
apt-get install --no-install-recommends -y rclone fuse
chown root:${USERNAME} /home/${USERNAME}/.config/rclone/rclone.conf
# see https://tcude.net/setting-up-rclone-with-google-drive/
mkdir -p /mnt/gdrive
cat > /etc/systemd/system/gdrive.service << EOL
[Unit]
Description=rclone for remote ${GDRIVE_USER}
AssertPathIsDirectory=/mnt/gdrive
After=networking.service

[Service]
Type=simple
ExecStart=rclone mount --config=/home/${USERNAME}/.config/rclone/rclone.conf ${GDRIVE_USER}: /mnt/gdrive --allow-other --cache-db-purge --fast-list --poll-interval 10m
ExecStop=/bin/fusermount -u /mnt/gdrive
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOL
systemctl daemon-reload
systemctl enable gdrive.service
systemctl start gdrive.service
