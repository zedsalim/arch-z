
#!/bin/bash

cd /mnt/FILES/My_Stuff/c_projects

# List all directories in the current directory
dirs=(*/)
# echo "Please choose a project by entering the corresponding number:"

# Loop through the directories and construct a list with numbers
project_list=""
for i in "${!dirs[@]}"; do
    project_list+="$(($i + 1)). $(basename "${dirs[$i]}")\n"
done

# Use rofi to display the menu and prompt the user to select a project
selected_project=$(echo -e "$project_list" | rofi -l 30 -dmenu -p "Select a project:" | awk '{gsub(/\./,""); print $1}')

# Check if the selection is empty
if [[ -z $selected_project ]]; then
    echo "No project selected. Exiting."
    exit 0
fi

# Check if the selection is a valid number
re='^[0-9]+$'
if ! [[ $selected_project =~ $re ]]; then
    echo "Error: Not a valid number" >&2
    exit 1
fi

# Check if the selection is within the valid range
if (( selected_project < 1 || selected_project > ${#dirs[@]} )); then
    echo "Error: Invalid selection" >&2
    exit 1
fi

# Get the name of the selected directory
index=$(($selected_project - 1))
name=${dirs[$index]}
name=${name::-1}

cd "$name"

# Open main.c in nvim
kitty -e "nvim" main.c
