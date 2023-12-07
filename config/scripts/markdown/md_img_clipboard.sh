#!/bin/bash

# Run Flameshot GUI with a custom save path
# flameshot_gui_output=$(flameshot gui -p /mnt/FILES/MD_IMGS 2>&1)
flameshot_gui_output=$(flameshot gui -p /mnt/FILES/Notes/IMGs 2>&1)

# Check if Flameshot capture was successful
if [ $? -eq 0 ]; then
    # Extract the path to the captured image from the Flameshot output
    screenshot_path=$(echo "$flameshot_gui_output" | grep -oP 'Capture saved as \K.*')

    # Add Markdown image syntax and copy it to clipboard
    # markdown_syntax="![img]($screenshot_path)"
    markdown_syntax="<img src=\"$screenshot_path\" alt=\"img\" style=\"max-width: 100%; display: block; margin: 0 auto;\">"
    echo -n "$markdown_syntax" | xclip -selection clipboard

    # Print the path to the saved image
    echo "$screenshot_path"
else
    # Print an error message if Flameshot failed
    echo "Flameshot capture failed: $flameshot_gui_output"
fi
