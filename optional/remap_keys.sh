#!/bin/bash

# Disable Caps Lock key
setxkbmap -option caps:none

# Remap Caps Lock to Escape
xmodmap -e "keycode 66 = Escape"
xmodmap -e "keycode 9 = Caps_Lock"

echo "Caps Lock remapped to Esc and Esc remapped to Caps Lock."
