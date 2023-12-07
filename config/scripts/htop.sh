#!/bin/bash

# Application to block
app_to_block="htop"

# Get the duration in minutes from the user
# read -p "Enter the amount of time to block access (in minutes): " duration_minutes

duration_minutes=$(rofi -dmenu -p "Enter the amount of time to block Htop: ")

# Calculate the duration in seconds
duration_seconds=$((duration_minutes * 60))

# Function to block the application by killing it
block_application() {
    local app=$1
    while true; do
        killall "$app"
        sleep 1
    done
}

# Block the application in the background and capture its PID
block_application "$app_to_block" &
block_pid=$!

# Trap script exit to ensure the background process is killed
trap 'kill -9 $block_pid' EXIT

# Sleep for the specified duration
sleep $duration_seconds

# The trap will automatically kill the background process when the script exits

notify-send --urgency=critical 'Htop' 'Access restored!'
