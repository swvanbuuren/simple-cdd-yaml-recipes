#!/bin/sh
curl -sS https://debian.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc | gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/debian.griffo.io.gpg
echo "deb https://debian.griffo.io/apt $(lsb_release -sc 2>/dev/null) main" | tee /etc/apt/sources.list.d/debian.griffo.io.list
apt-get update
apt-get install --no-install-recommends -y mesa-vulkan-drivers zed

# if we're on trixie add trixie-backports and update from there
. /etc/os-release
if [ "$VERSION_CODENAME" = "trixie" ]; then
    BACKPORT_LINE="deb http://deb.debian.org/debian/ trixie-backports main contrib non-free-firmware non-free"
    SOURCES_FILE="/etc/apt/sources.list.d/trixie-backports.list"
    echo "$BACKPORT_LINE" | tee "$SOURCES_FILE" > /dev/null
    apt-get update
    apt-get install --no-install-recommends -y mesa-vulkan-drivers/trixie-backports
fi
