#!/bin/bash

# Get volume percentage and mute status
volume_info=$(pactl list sinks | grep 'Volume:' | awk 'NR==3{print $5}' | sed 's/%//')
mute_status=$(pactl list sinks | grep 'Mute:' | awk 'NR==2{print $2}')

if [ "$mute_status" = "yes" ]; then
    echo "🔇"
else
    echo "VOL: $volume_info%"
fi
