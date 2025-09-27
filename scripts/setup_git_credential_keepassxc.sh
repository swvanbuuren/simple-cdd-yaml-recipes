#!/bin/sh
USERNAME={{username}}
BIN_DIR=/home/${USERNAME}/bin
CONFIGURE_CMD=${BIN_DIR}/configure-git-credential-helper
VERSION=v{{ version | default("0.14.1") }}
apt-get update
apt-get install --no-install-recommends -y wget unzip
wget https://github.com/Frederick888/git-credential-keepassxc/releases/download/${VERSION}/ubuntu-latest-full.zip
mkdir -p ${BIN_DIR}
unzip ubuntu-latest-full.zip -d ${BIN_DIR}
rm ubuntu-latest-full.zip
cat > ${CONFIGURE_CMD} << EOL
read -p "Make sure KeePassXC is running [OK]" -n 1 -r PROCEED
PROCEED=${name:-OK}
if [ "${PROCEED}" == "OK" ] ; then
    git-credential-keepassxc caller add me
    git-credential-keepassxc configure
    git-credential-keepassxc caller add --uid 1000 --gid 1000 /usr/lib/git-core/git
fi
EOL
chmod +x ${CONFIGURE_CMD}
chown -R ${USERNAME}:${USERNAME} ${BIN_DIR}
