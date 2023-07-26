#!/bin/bash

sudo su <<EOF
mkdir -p /home/$USER/.local/share/file-manager/actions/
touch /home/$USER/.local/share/file-manager/actions/terminal.desktop
echo "[Desktop Entry]
Type=Action
Tooltip=Open Terminal
Name=Open Terminal
Profiles=profile-one;
Icon=utilities-terminal

[X-Action-Profile profile-one]
MimeTypes=inode/directory;
Exec=kitty --working-directory %f
Name=Default profile" > /home/$USER/.local/share/file-manager/actions/terminal.desktop
exit
EOF
