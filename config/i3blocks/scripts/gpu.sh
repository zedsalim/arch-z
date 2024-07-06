#!/bin/bash

# Get the GPU temperature from sensors
# nvidia driver
# gpu_temp=$(nvidia-smi | sed -n '10p' | grep -o '[0-9]*C' | sed 's/C//')
# nouveau driver
gpu_temp=$(sensors | grep 'temp1' | awk '{print int($2)}')

# Debugging output
echo "GPU: $gpu_temp°C"
