#!/bin/bash

xrandr --output DVI-D-1 --mode 1920x1080 --pos 900x0 --rotate normal --brightness 1.0 --gamma 1.0:1.0:1.0 \
       --output HDMI-1 --mode 1600x900 --pos 0x0 --rotate right --brightness 1.0 --gamma 1.0:1.0:1.0

source ~/.config/scripts/last-single-wallpapers.sh

# i3-msg restart
