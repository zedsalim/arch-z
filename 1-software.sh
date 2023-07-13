#!/bin/bash

PKGS=(
    # Section 1: Xorg and Window Manager
    'xorg'                   # Display server
    'xorg-xinit'             # Xorg initialization scripts
    'xorg-xinput'            # Xorg input device configuration
    # 'xterm'                # Terminal emulator
    'pam'                    # Pluggable Authentication Modules
    'xcb'                    # X protocol C-language Binding
    'xorg-server'            # Xorg server
    'xorg-xauth'             # X authority utility
    'xdg-user-dirs'          # Tool to manage user directories
    'xdotool'                # Automation tool
    'xbindkeys'              # Keyboard binding configuration

    # Section 2: Window Manager Tools
    'brightnessctl'          # Backlight control
    'i3-gaps'                # Tiling window manager
    'rofi'                   # Application launcher
    'dmen'                   # Dynamic menu
    'polybar'                # Status bar
    'dunst'                  # Notification daemon
    'libnotify'              # Notification library
    'picom'                  # Compositor
    'kitty'                  # Terminal emulator
    'alacritty'              # Terminal emulator
    'lxappearance'           # GTK+ theme switcher
    'wget'                   # File downloader
    'polkit-gnome'           # PolicyKit authentication agent
    'gvfs-mtp'               # MTP support for file managers
    'dosfstools'             # Managing FAT file systems
    'ntfs-3g'                # Managing NTFS file systems

    # Section 3: File Managers
    'thunar'                 # File manager
    'pcmanfm'                # File manager
    'ranger'                 # File manager

    # Section 4: System Utilities
    'network-manager-applet' # Network manager applet
    'gnome-disk-utility'     # Disk management utility
    'gparted'                # Partition editor
    'bleachbit'              # System cleaner
    # 'neofetch'             # System information tool (i'm using ufetch script instead)
    'arandr'                 # Screen layout editor
    'htop'                   # System monitoring tool
    'dbus'                   # Message bus system
    'python-pip'             # Package installer for Python
    'github-cli'             # Interact with GitHub repositories via command line

    # Section 5: Image and Media Tools
    'feh'                    # Image viewer and wallpaper setter
    'mpv'                    # Media player
    'viewnior'               # Image viewer
    'flameshot'              # Screenshot tool
    'sxiv'                   # Image viewer
    # 'ueberzug'             # Image viewer
    # 'w3m'                  # Text-based web browser
    'python-pillow'          # Image processing library

    # Section 6: Keybindings and Utilities
    'sxhkd'                  # X hotkey daemon
    'numlockx'               # Num Lock status control
    'neovim'                 # Text editor
    'mousepad'               # Text editor

    # Section 7: Sound and Audio
    'pulseaudio'             # Sound server
    'alsa-utils'             # Sound utilities
    'pavucontrol'            # Sound mixer

    # Section 8: Development Tools
    'telegram-desktop'       # Messaging app
    'code'                   # Source code editor
    'git'                    # Version control system

    # Section 9: Compression and Archive Tools
    'unzip'                  # Zip file extractor
    'zip'                    # Zip file compressor
    'file-roller'            # Archive manager

    # Section 11: Bluetooth and Printer
    'bluez'                  # Bluetooth stack utilities
    'bluez-utils'            # Bluetooth stack utilities
    'blueman'                # Bluetooth manager
    'cups'                   # Printing system
    'simple-scan'            # Document scanner

    # Section 12: Other Tools and Libraries
    'galculator'             # Calculator
    'zathura-pdf-poppler'    # PDF viewer
    'qbittorrent'            # BitTorrent client
    'filezilla'              # FTP application

    # Section 13: Miscellaneous Utilities
    'xfce4-power-manager'    # Power manager
    'exa'                    # Replacement for 'ls' command
    'xclip'                  # Command line interface to X selections
    'npm'                    # Package manager for JavaScript
    'jdk-openjdk'            # Java Development Kit

    # Section 14: Drivers
    'nvidia'
    # 'xf86-input-libinput'
    # 'xf86-input-evdev'
    # 'xf86-video-fbdev'
    # 'xf86-video-intel'
    # 'xf86-video-nouveau'
    # 'xf86-video-vmware'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

sudo systemctl enable cups
sudo systemctl enable bluetooth
