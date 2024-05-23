#!/bin/sh
USERNAME={{username}}
apt-get install --no-install-recommends -y fuse3
mkdir -p /home/${USERNAME}/.local/bin
wget -O /home/${USERNAME}/.local/bin/Snes9x.AppImage https://github.com/snes9xgit/snes9x/releases/download/1.62.3/Snes9x-1.62.3-x86_64.AppImage
chmod +x /home/${USERNAME}/.local/bin/Snes9x.AppImage
wget -O /home/${USERNAME}/.local/share/applications/snes9x_logo.png https://upload.wikimedia.org/wikipedia/commons/b/bd/SNES9X_logo.png
cat > /home/${USERNAME}/.local/share/applications/Snes9x.dekstop << EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=Snes9x
Comment=
Categories=Game
Exec=/home/${USERNAME}/.local/bin/Snes9x.AppImage
Icon=/home/${USERNAME}/.local/share/applications/snes9x_logo.png
Path=
Terminal=false
StartupNotify=false
EOL
