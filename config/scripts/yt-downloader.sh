#!/bin/bash

target_directory="$HOME/Downloads/YT-DOWNLOADS"
[ -d "$target_directory" ] || mkdir -p "$target_directory"

cd $target_directory

# Function to prompt user for choice
get_choice() {
    local choice
    read -p "Do you want to download a single video or a playlist? (1/2): " choice
    echo "$choice"
}

# Function to download video or playlist
download() {
    local url="$1"
    local output_format="$2"

    echo "Downloading..."
    # yt-dlp -f "b" -S "filesize~50M" -o "$output_format" "$url"
    yt-dlp -S "height:720"  -o "$output_format" "$url"
}

# Read the video URL from the clipboard
url=$(xclip -o -selection clipboard)

# Check for video quality options
output_format_video="%(title)s.%(ext)s"
output_format_playlist="%(playlist_index)s - %(title)s.%(ext)s"

choice=$(get_choice)

case "$choice" in
    1)
        download "$url" "$output_format_video"
        ;;
    2)
        download "$url" "$output_format_playlist"
        ;;
    *)
        echo "Invalid choice. Please enter '1' or '2'."
        ;;
esac
