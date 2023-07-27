#!/bin/bash

PKGS=(
    # Section 1: Xorg and Window Manager
    'xorg'                   # Display server
    'xorg-xinit'             # Xorg initialization scripts
    'xorg-xinput'            # Xorg input device configuration
    'pam'                    # Pluggable Authentication Modules
    'xcb'                    # X protocol C-language Binding
    'xorg-server'            # Xorg server
    'xorg-xauth'             # X authority utility
    'xdg-user-dirs'          # Tool to manage user directories
    'xdotool'                # Automation tool
    'xbindkeys'              # Keyboard binding configuration

    # Section 2: Window Manager Tools
    # 'brightnessctl'          # Backlight control
    'i3-gaps'                # Tiling window manager
    'rofi'                   # Application launcher
    'dmenu'                  # Dynamic menu
    'polybar'                # Status bar
    'dunst'                  # Notification daemon
    'libnotify'              # Notification library
    'picom'                  # Compositor
    'kitty'                  # Terminal emulator
    'lxappearance'           # GTK+ theme switcher
    'wget'                   # File downloader
    'polkit-gnome'           # PolicyKit authentication agent
    'gvfs-mtp'               # MTP support for file managers
    'dosfstools'             # Managing FAT file systems
    'ntfs-3g'                # Managing NTFS file systems

    # Section 3: File Managers
    'thunar'                 # File manager
    'pcmanfm'                # File manager
    'ranger'                 # Terminal file manager

    # Section 4: System Utilities
    'network-manager-applet' # Network manager applet
    'gparted'                # Partition editor
    'bleachbit'              # System cleaner
    'arandr'                 # Screen layout editor
    'htop'                   # System monitoring tool
    'dbus'                   # Message bus system
    'python-pip'             # Package installer for Python
    'github-cli'             # Interact with GitHub repositories via command line
    'tmux'                   # Terminal multiplexer
    'openssh'                # Suite of secure networking utilities
    'rsync'                  # For transferring and synchronizing files

    # Section 5: Image and Media Tools
    'feh'                    # Image viewer and wallpaper setter
    'viewnior'               # Image viewer
    'flameshot'              # Screenshot tool
    'sxiv'                   # Image viewer
    'python-pillow'          # Image processing library

    # Section 6: Keybindings and Utilities
    'sxhkd'                  # X hotkey daemon
    'numlockx'               # Num Lock status control
    'neovim'                 # hyperextensible Vim-based text editor

    # Section 7: Sound and Audio
    'pulseaudio'             # Sound server
    # 'pulseaudio-bluetooth'   # Bluetooth sound server
    # 'pulseaudio-alsa'        # Sound server
    'alsa-utils'             # Sound utilities
    'pavucontrol'            # Sound mixer

    # Section 8: Development Tools
    'telegram-desktop'       # Messaging app
    'code'                   # Source code editor
    'git'                    # Version control system
    'chromium'               # Web Browser

    # Section 9: Compression and Archive Tools
    'unzip'                  # Zip file extractor
    'zip'                    # Zip file compressor
    'p7zip'                  # Zip file compressor
    'file-roller'            # Archive manager

    # Section 11: Bluetooth and Printer
    # 'bluez'                  # Bluetooth stack utilities
    # 'bluez-utils'            # Bluetooth stack utilities
    # 'blueman'                # Bluetooth manager
    'cups'                   # Printing system
    'simple-scan'            # Document scanner

    # Section 12: Other Tools and Libraries
    'galculator'             # Calculator
    'zathura-pdf-poppler'    # PDF viewer
    'qbittorrent'            # BitTorrent client
    'filezilla'              # FTP application
    'discord'                # Messaging and VoIP social platform

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
# sudo systemctl enable bluetooth
