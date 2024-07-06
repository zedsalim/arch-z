#!/bin/bash

# Open Kitty in the background to list the projects
kitty --class KittyC -e sh -c 'exa -1 --group-directories-first /mnt/FILES/My_Stuff/_Projects/C; exec sh' &

# Store the project name entered in Rofi
name=$(rofi -dmenu -p "Enter the project's name:")

# Check if the project name is empty
if [[ -z $name ]]; then
    echo "No project name entered. Exiting."
    pkill -f "kitty --class KittyC -e sh -c exa -1 --group-directories-first /mnt/FILES/My_Stuff/_Projects/C; exec sh"
    exit 0
fi

# Create the project directory
mkdir "/mnt/FILES/My_Stuff/_Projects/C/$name"
cd "/mnt/FILES/My_Stuff/_Projects/C/$name"

pkill -f "kitty --class KittyC -e sh -c exa -1 --group-directories-first /mnt/FILES/My_Stuff/_Projects/C; exec sh"

# Create main.c file
touch main.c

echo "#include <stdio.h>

int main()
{

    return 0;
}" > main.c

# Open main.c in nvim
kitty -e "nvim" main.c
