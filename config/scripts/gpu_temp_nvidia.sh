#!/bin/bash

# Get the GPU temperature
gpu_temp=$(nvidia-smi | sed -n '10p' | grep -o '[0-9]*C' | sed 's/C//')

# Check if the temperature is less than or equal to 75
if [ "$gpu_temp" -le 75 ]; then
    # echo "${gpu_temp}C - Safe"
    notify-send 'GPU Temp' "${gpu_temp}C - Safe"
else
    notify-send --urgency=critical 'GPU Temp' "${gpu_temp}C - Danger"
fi
