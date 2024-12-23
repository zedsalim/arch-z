#!/bin/bash

# Get the CPU temperature using 'sensors' command
cpu_temp=$(sensors | grep 'Tctl:' | awk '{print $2}')

# Send a notification with the CPU temperature
notify-send "CPU Temperature" "Current CPU Temperature: $cpu_temp"
