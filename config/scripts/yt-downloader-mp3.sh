#!/bin/bash

target_directory="$HOME/Downloads/YT-DOWNLOADS"
[ -d "$target_directory" ] || mkdir -p "$target_directory"

cd $target_directory

# Function to download video or playlist
download() {
    local url="$1"
    echo "Downloading..."
    yt-dlp -x --audio-format mp3 --output "%(playlist_index)s - %(title)s.%(ext)s" "$url"
    # yt-dlp -x --audio-format mp3 --output "%(title)s.%(ext)s" "$url"
}

# Read the video URL from the clipboard
url=$(xclip -o -selection clipboard)

download "$url"
