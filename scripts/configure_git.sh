#!/bin/sh
cat > /tmp/.gitconfig << EOL
[user]
	name = {{user_fullname}}
	email = {{user_email}}
[core]
	editor = {{editor}}
[pull]
	ff = only
EOL
su - {{username}} << 'EOF'
cp /tmp/.gitconfig $HOME/.gitconfig
EOF
