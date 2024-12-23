#!/bin/bash

xrandr --output DVI-D-0 --mode 1920x1080 --pos 900x0 --rotate normal --output HDMI-0 --mode 1600x900 --pos 0x0 --rotate right --output DP-0 --off --output DP-1 --off

source ~/.config/scripts/last-single-wallpapers.sh

# source ~/.config/scripts/last-two-wallpapers.sh

# i3-msg restart
