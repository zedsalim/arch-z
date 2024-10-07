#!/bin/bash

# Install ibus, ibus-m17n, m17n-db
sudo pacman -S --noconfirm ibus ibus-m17n m17n-db

# localectl --no-convert set-x11-keymap fr
# setxkmap fr
