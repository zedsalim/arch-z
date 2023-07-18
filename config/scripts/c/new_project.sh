#!/bin/bash

# Open Alacritty in the background to list the projects
alacritty --class AlacrittyC -e sh -c 'exa -1 --group-directories-first /mnt/FILES/My_Stuff/c_projects; exec sh' &

# Store the project name entered in Rofi
name=$(rofi -dmenu -p "Enter the project's name:")

# Check if the project name is empty
if [[ -z $name ]]; then
    echo "No project name entered. Exiting."
    killall -q -9 alacritty
    exit 0
fi

# Create the project directory
mkdir "/mnt/FILES/My_Stuff/c_projects/$name"
cd "/mnt/FILES/My_Stuff/c_projects/$name"

killall -q -9 alacritty

# Create main.c file
touch main.c

echo "#include <stdio.h>

int main()
{

    return 0;
}" > main.c

# Open main.c in nvim
kitty -e "nvim" main.c
