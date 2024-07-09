#!/bin/bash

echo "separator=true
separator_block_width=15

[time]
command=date '+%Y-%m-%d %H:%M                                                 '
command=date '+%Y-%m-%d %H:%M                                                 +%Y-%m-%d %H:%M'
interval=1

[arch_update]
color=#1793d1
command=echo "$(checkupdates | wc -l) "
interval=once
label= 
border=#1793d1
border_top=0
border_right=1
border_bottom=0
border_left=0

[cpu]
command=~/.config/i3blocks/scripts/cpu.sh
interval=5

[gpu]
command=~/.config/i3blocks/scripts/gpu.sh
interval=5

[ram]
command=~/.config/i3blocks/scripts/ram.sh
interval=1

[volume]
command=~/.config/i3blocks/scripts/volume.sh
interval=1
" > /home/zed/.config/i3blocks/i3blocks.conf

# xrandr --output DVI-D-0 --mode 1600x900 --pos 0x0 --rotate right --output HDMI-0 --off --output DP-0 --primary --mode 1920x1080 --pos 900x0 --rotate normal --output DP-1 --off --output None-1-1 --off


xrandr --output DVI-D-1 --mode 1600x900 --pos 0x0 --rotate right --output HDMI-1 --off --output DP-1 --primary --mode 1920x1080 --pos 900x0 --rotate normal

source ~/.config/scripts/last-two-wallpapers.sh

i3-msg restart
