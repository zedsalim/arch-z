#!/bin/bash

# Get the current date and time in the specified format
current_datetime=$(date +"%d/%m/%Y %H:%M")

# Notify the user with the current date and time
notify-send -u low 'Current Date and Time' "$current_datetime"
