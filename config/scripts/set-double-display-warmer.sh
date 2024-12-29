#!/bin/bash

xrandr --output DVI-D-0 --mode 1920x1080 --pos 900x0 --rotate normal --brightness 0.9 --gamma 1.2:1.1:0.9 \
       --output HDMI-0 --mode 1600x900 --pos 0x0 --rotate right --brightness 0.7 --gamma 1.2:1.1:0.9 \
       --output DP-0 --off --output DP-1 --off

# xrandr --output DVI-D-0 --mode 1920x1080 --pos 900x0 --rotate normal --brightness 1.0 --gamma 1.0:1.0:1.0 \
#        --output HDMI-0 --mode 1600x900 --pos 0x0 --rotate right --brightness 1.0 --gamma 1.0:1.0:1.0 \
#        --output DP-0 --off --output DP-1 --off

# xrandr --output DVI-D-0 --mode 1920x1080 --pos 900x0 --rotate normal --output HDMI-0 --mode 1600x900 --pos 0x0 --rotate right --output DP-0 --off --output DP-1 --off

source ~/.config/scripts/last-single-wallpapers.sh

# source ~/.config/scripts/last-two-wallpapers.sh

# i3-msg restart
