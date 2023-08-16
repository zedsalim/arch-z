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
    echo "USB device $selected_device mounted."
}

# Function to unmount the mounted device
umount_device() {
    selected_device=$(lsblk -ndo KNAME,MOUNTPOINT | grep -E '/run/media/' | awk '($2!="") {print $1}')

    if [ -z "$selected_device" ]; then
        echo "No device mounted. Nothing to unmount."
        exit 1
    fi

    chosen_device="$selected_device"

    if [ -z "$chosen_device" ]; then
        echo "No device selected. Exiting."
        exit 1
    fi

    udisksctl unmount -b "/dev/$chosen_device"
    echo "Device $chosen_device unmounted."
}

# Main script logic
case "$1" in
    mount)
        mount_usb
        ;;
    umount)
        umount_device
        ;;
    *)
        echo "Usage: $0 {mount|umount}"
        exit 1
        ;;
esac
