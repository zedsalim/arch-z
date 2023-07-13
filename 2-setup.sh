#!/bin/bash

xdg-user-dirs-update
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# yay -S ly
# sudo systemctl enable ly.service
sudo pacman -S lightdm lightdm-gtk-greeter
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

yay -S brave-bin
#yay -S gitahead
