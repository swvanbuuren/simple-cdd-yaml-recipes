#!/bin/sh
apt-get update
apt-get install --no-install-recommends -y dconf-cli
cat > /tmp/mousepad_settings << EOL
[preferences/view]
color-scheme='classic'
font-name='Monospace 10'
highlight-current-line=true
match-braces=true
show-line-numbers=true
show-right-margin=true
use-default-monospace-font=false

[preferences/window]
statusbar-visible=true

[state/window]
fullscreen=false
height=594
maximized=false
width=758
EOL
su - {{username}} << 'EOF'
dbus-launch dconf load /org/xfce/mousepad/ < /tmp/mousepad_settings
EOF
