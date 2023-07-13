#!/bin/bash

choice=$(cat /mnt/FILES/Files/Docs/bookmarks.txt | rofi -dmenu -l 30 -p "Choose Website: ")
[ -z "$choice" ] && exit 0 || echo "$choice" | xargs "$BROWSER" || echo "$choice" | xargs brave


sleep 1 && exit
