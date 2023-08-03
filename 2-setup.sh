#!/bin/bash

xdg-user-dirs-update

# Installing dependencies for Ly Console Manager (uncomment if you don't want LightDm)
# yay -S ly
# sudo systemctl enable ly.service

# Installing dependencies for LightDM Console Manager
sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm
sudo systemctl enable lightdm

# Configure xsessions
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Manual Window Manager
Exec=i3
Icon=i3
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/i3.desktop;rm ./temp

cd
touch .xinitrc
echo "exec i3" > .xinitrc
