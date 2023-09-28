#!/bin/bash

# Change the working directory
cd /home/zed/Documents/github/zedsalim/leetcode-solutions/

# Get the name from the clipboard
name=$(xclip -o -selection clipboard)

# Process the name to create a file name
file_name=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-').c

# Create the file with the processed name
touch "$file_name"

# Copy the processed name back to the clipboard
echo -n "$name" | xclip -selection clipboard
