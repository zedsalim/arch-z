
#!/bin/bash

# Check if dmenu is installed
if ! command -v dmenu >/dev/null; then
    echo "Please install dmenu to use this script."
    exit 1
fi

# Function to list connected USB devices
list_usb_devices() {
    lsblk -ndo KNAME,MODEL | awk '($2!="") {print $1, $2}'
}

# Function to mount a selected USB device
mount_usb() {
    selected_device=$(list_usb_devices | dmenu -p "Select USB device to mount:" | awk '{print $1}')

    if [ -z "$selected_device" ]; then
        echo "No device selected. Exiting."
        exit 1
    fi

    udisksctl mount -b "/dev/$selected_device"
    notify-send 'ZED' 'USB device mounted'
}

# Main script logic
mount_usb
