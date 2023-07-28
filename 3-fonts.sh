#!/bin/bash

fonts_dir="$HOME/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

cd
cd arch-z/fonts
7z x Hack-NerdFont.7z
7z x JetBrainsMono.7z
mv *.ttf ~/.local/share/fonts

fc-cache -fv

sudo pacman -S --noconfirm ttf-font-awesome ttf-dejavu ttf-liberation noto-fonts noto-fonts-emoji ttf-fira-code ttf-ubuntu-font-family

yay -S --noconfirm ttf-arabeyes-fonts ttf-ubuntu-arabic
