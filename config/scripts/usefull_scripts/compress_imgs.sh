#!/bin/bash

# Function to compress a single image using ImageMagick's mogrify
compress_image() {
    input_file="$1"
    echo "Compressing $input_file..."
    mogrify -format jpg -quality "$quality" "$input_file"
}

# Function to process all image files in a folder and its subfolders
process_images() {
    find "$1" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | while read -r image_file; do
        compress_image "$image_file"
    done
}

# Main script

# Check if ImageMagick's mogrify is installed
if ! command -v mogrify &>/dev/null; then
    echo "ImageMagick not found. Please install it first."
    exit 1
fi

# Check if the folder path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

image_dir="$1"

# Check if the provided folder path is valid
if [ ! -d "$image_dir" ]; then
    echo "Invalid folder path. Please provide a valid directory path."
    exit 1
fi

# Quality for image compression (adjust as needed, 1-100, where 100 is best quality)
quality=20

# Process all image files in the provided folder and its subfolders
process_images "$image_dir"

echo "Image compression complete."
