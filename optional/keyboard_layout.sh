#!/bin/bash

# Install ibus, ibus-m17n, m17n-db, and xfonts-intl-arabic
sudo pacman -S --noconfirm ibus ibus-m17n m17n-db xorg-fonts-encodings

# localectl --no-convert set-x11-keymap fr
# setxkmap fr
