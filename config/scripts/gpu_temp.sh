#!/bin/bash

# Get the GPU temperature from sensors
gpu_temp=$(sensors | grep 'temp1' | awk '{print int($2)}')

# Debugging output
echo "Extracted GPU temperature: $gpu_temp"

# Check if the temperature is a valid number
if [[ -z "$gpu_temp" ]]; then
    echo "Failed to retrieve GPU temperature."
    exit 1
fi

# Check if the temperature is less than or equal to 75
if [ "$gpu_temp" -le 75 ]; then
    notify-send 'GPU Temp' "${gpu_temp}°C - Safe"
else
    notify-send --urgency=critical 'GPU Temp' "${gpu_temp}°C - Danger"
fi
