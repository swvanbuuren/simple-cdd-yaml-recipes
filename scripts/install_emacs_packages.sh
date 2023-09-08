#!/bin/sh
apt-get -y update
apt-get install --no-install-recommends -y wget
EMACS_DIR="/{{username}}/.emacs.d"
if [ "{{username}}" != "root" ]; then
    EMACS_DIR="/home${EMACS_DIR}"
fi
URL_PREFIX="https://raw.githubusercontent.com"
su - {{username}} << 'EOF'
mkdir -p $EMACS_DIR/el
wget -P $EMACS_DIR/el $URL_PREFIX/jasonm23/autothemer/0.2.14/autothemer.el
wget -P $EMACS_DIR/el $URL_PREFIX/magnars/dash.el/2.19.1/dash.el
wget -P $EMACS_DIR/el $URL_PREFIX/greduan/emacs-theme-gruvbox/1.30.1/gruvbox.el
wget -P $EMACS_DIR/el $URL_PREFIX/jrblevin/markdown-mode/v2.6/markdown-mode.el
wget -P $EMACS_DIR/el $URL_PREFIX/jaypei/emacs-neotree/0.5.1/neotree.el
wget -P $EMACS_DIR/el $URL_PREFIX/yoshiki/yaml-mode/0.0.15/yaml-mode.el
mkdir -p $EMACS_DIR/themes
wget -P $EMACS_DIR/themes $URL_PREFIX/greduan/emacs-theme-gruvbox/1.30.1/gruvbox-dark-hard-theme.el
wget -P $EMACS_DIR/themes $URL_PREFIX/greduan/emacs-theme-gruvbox/1.30.1/gruvbox-dark-medium-theme.el
wget -P $EMACS_DIR/themes $URL_PREFIX/greduan/emacs-theme-gruvbox/1.30.1/gruvbox-dark-soft-theme.el
wget -O $EMACS_DIR/yaml-mode_license.txt $URL_PREFIX/yoshiki/yaml-mode/0.0.15/LICENSE.txt
wget -O $EMACS_DIR/gruvbox_license $URL_PREFIX/greduan/emacs-theme-gruvbox/1.30.1/LICENSE
wget -O $EMACS_DIR/neotree_license $URL_PREFIX/jaypei/emacs-neotree/0.5.1/LICENSE
wget -O $EMACS_DIR/markdown-mode_license.md $URL_PREFIX/jrblevin/markdown-mode/v2.6/LICENSE.md
wget -O $EMACS_DIR/dash_license $URL_PREFIX/magnars/dash.el/2.19.1/LICENSE
wget -O $EMACS_DIR/autotheme_license $URL_PREFIX/jasonm23/autothemer/0.2.14/LICENSE
EOF
