#!/bin/bash

# Get volume percentage and mute status
volume_info=$(amixer get Master | grep -oE '[0-9]+%' | head -n 1)
mute_status=$(amixer get Master | grep -oE '\[(on|off)\]' | head -n 1)

if [ "$mute_status" = "[off]" ]; then
    echo "🔇"
else
    echo "VOL: $volume_info"
fi
