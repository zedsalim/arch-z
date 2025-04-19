#!/bin/bash

xrandr --output DVI-D-1 --mode 1920x1080 --pos 0x0 --rotate normal --brightness 0.8 --gamma 1.2:1.1:0.9 --output HDMI-1 --off

source ~/.config/scripts/last-single-wallpapers.sh

# i3-msg restart
