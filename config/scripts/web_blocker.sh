#!/bin/bash

# Website domain to block
website="www.youtube.com"

# IP address to redirect to (localhost)
redirect_ip="127.0.0.1"

# Prompt for the duration using dmenu
duration=$(rofi -dmenu -p "Enter block duration (minutes): ")

# Backup the original hosts file
cp /etc/hosts /etc/hosts.backup

# Add an entry to redirect Website to the specified IP address
bash -c "echo $redirect_ip $website >> /etc/hosts"

# Wait for the specified duration
sleep "${duration}m"

# Remove the entry from the hosts file to unblock Website
sed -i "/$website/d" /etc/hosts

# Remove the backup file
sudo rm /etc/hosts.backup

# Notification
notify-send 'W-Blocker' 'Website unblocked'

exit 0
