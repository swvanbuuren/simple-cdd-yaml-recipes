#!/bin/sh
apt-get update
apt-get install --no-install-recommends -y qt5ct qt5-style-plugins
cat > /tmp/qt5ct.conf << EOL
[Appearance]
color_scheme_path=/usr/share/qt5ct/colors/airy.conf
custom_palette=false
icon_theme=elementary-xfce
standard_dialogs=default
style=gtk2

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x14\0S\0\x61\0n\0s\0 \0S\0\x65\0r\0i\0\x66@\"\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\x14\0S\0\x61\0n\0s\0 \0S\0\x65\0r\0i\0\x66@\"\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

[Interface]
activate_item_on_single_click=1
buttonbox_layout=3
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3

[QSSEditor]
geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x5t\0\0\x1\xa9\0\0\a\xf8\0\0\x3\xb4\0\0\x5u\0\0\x1\xc1\0\0\a\xf7\0\0\x3\xb3\0\0\0\0\0\0\0\0\rp\0\0\x5u\0\0\x1\xc1\0\0\a\xf7\0\0\x3\xb3)

[SettingsWindow]
geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\x5G\0\0\x1\x91\0\0\b'\0\0\x3\xfb\0\0\x5H\0\0\x1\xa9\0\0\b&\0\0\x3\xfa\0\0\0\0\0\0\0\0\rp\0\0\x5H\0\0\x1\xa9\0\0\b&\0\0\x3\xfa)
EOL
su - {{username}} << 'EOF'
mkdir -p $HOME/.config/qt5ct
cp /tmp/qt5ct.conf $HOME/.config/qt5ct/.
echo "# Qt should respect platform theme" >> $HOME/.profile
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> $HOME/.profile
EOF
