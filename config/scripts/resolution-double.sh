#!/bin/sh

# nvidia dirver
# xrandr --output DP-0 --primary --mode 1920x1080 --pos 900x0 --rotate normal --output DP-1 --off --output HDMI-0 --mode 1600x900 --pos 0x0 --rotate right --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output None-1-1 --off

# new driver
xrandr --output DVI-D-1 --mode 1600x900 --pos 0x0 --rotate right --output HDMI-1 --off --output DP-1 --primary --mode 1920x1080 --pos 900x0 --rotate normal

