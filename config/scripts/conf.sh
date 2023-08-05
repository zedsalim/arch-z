#!/bin/bash

# Define the choices
choices=("i3-config" "i3-workspaces" "i3-colors" "sxhkd" "polybar" "kitty" "vifm"  "github" "scripts" )

# Prompt the user to select a choice using rofi
selected_choice=$(printf '%s\n' "${choices[@]}" | rofi -dmenu -p "Select a config file:")

# Define the corresponding config file paths
case $selected_choice in
    "i3-config")
        config_file="$HOME/.config/i3/config"
        ;;
    "i3-workspaces")
        config_file="$HOME/.config/i3/workspaces.conf"
        ;;
    "i3-colors")
        config_file="$HOME/.config/i3/colors.conf"
        ;;
    "sxhkd")
        config_file="$HOME/.config/sxhkd/sxhkdrc"
        ;;
    "polybar")
        config_file="$HOME/.config/polybar/config"
        ;;
    "kitty")
        config_file="$HOME/.config/kitty/kitty.conf"
        ;;
    "vifm")
        config_file="$HOME/.config/vifm/vifmrc"
        ;;
    "github")
        config_file="vifm $HOME/Documents/github/"
        ;;
    "scripts")
        config_file="vifm $HOME/.config/scripts"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Check if the config file exists
if [[ $config_file == vifm* ]]; then
    # Open the selected directory with Vifm
    $config_file
else
    # Open the selected config file with Vim
    nvim "$config_file"
fi
