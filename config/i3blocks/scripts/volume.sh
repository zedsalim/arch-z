#!/bin/bash

# Get volume percentage and mute status
volume_info=$(pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | tr -d '%')
mute_status=$(pactl list sinks | grep 'Mute:' | head -n 1 | awk '{print $2}')

if [ "$mute_status" = "yes" ]; then
    echo "🔇"
else
    echo "VOL: $volume_info%"
fi
