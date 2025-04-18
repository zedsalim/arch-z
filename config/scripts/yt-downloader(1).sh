#!/bin/bash

target_directory="$HOME/Downloads/YT-DOWNLOADS"
[ -d "$target_directory" ] || mkdir -p "$target_directory"

cd "$target_directory"

# Function to prompt user for choice
get_choice() {
    local choice
    read -p "Do you want to download a single video or a playlist? (1/2): " choice
    echo "$choice"
}

# Function to download a single video
download_video() {
    local url="$1"
    local output_format="$2"

    echo "Downloading video..."
    yt-dlp -S "height:720" --write-description -o "$output_format" "$url"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        # Display notification if download is completed successfully
        notify-send --expire-time=120000 --urgency=critical "Wake Up!" "Download Completed"
    else
        echo "Download failed."
    fi
}

# Function to download a playlist
download_playlist() {
    local url="$1"

    echo "Downloading playlist..."
    yt-dlp -S "height:720" --write-description --yes-playlist -o "$target_directory/%(playlist_index)02d - %(title)s/%(playlist_index)02d - %(title)s.%(ext)s" "$url"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        # Display notification if download is completed successfully
        notify-send --expire-time=120000 --urgency=critical "Wake Up!" "Download Completed"
    else
        echo "Download failed."
    fi
}

# Read the video URL from the clipboard
url=$(xclip -o -selection clipboard)

# Check for video quality options
output_format_video="%(title)s.%(ext)s"

choice=$(get_choice)

case "$choice" in
    1)
        download_video "$url" "$output_format_video"
        ;;
    2)
        download_playlist "$url"
        ;;
    *)
        echo "Invalid choice. Please enter '1' or '2'."
        ;;
esac
