
#!/bin/bash

cd /home/zed/Downloads/

# Function to download video with the specified quality
download_video() {
    local url="$1"
    local quality="$2"
    echo "Downloading video with $quality resolution..."
    yt-dlp -f "bestvideo[height<=$quality][ext=mp4]+bestaudio[ext=m4a]/best[height<=$quality][ext=mp4]/best" -o "%(title)s.%(ext)s" "$url"
}

# Function to download playlist
download_playlist() {
    local url="$1"
    echo "Downloading playlist..."
    yt-dlp -o "%(playlist_index)s - %(title)s.%(ext)s" "$url"
}

# Check if xclip is installed
if ! command -v xclip &> /dev/null; then
    echo "xclip is not installed. Please install it using 'sudo apt-get install xclip' (for Ubuntu/Debian) or appropriate package manager for your distribution."
    exit 1
fi

# Read the video URL from the clipboard
url=$(xclip -o -selection clipboard)

if [ -z "$url" ]; then
    echo "No video URL found in the clipboard. Please copy a video URL and run the script again."
    exit 1
fi

echo "Do you want to download a single video or a playlist?"
echo "Enter '1' for a single video or '2' for a playlist: "
read choice

if [ "$choice" = "1" ]; then
    preferred_quality=720

    # Check if the video is available in the preferred quality
    yt-dlp -F "$url" | grep -q "$preferred_quality"

    if [ $? -eq 0 ]; then
        download_video "$url" "$preferred_quality"
    else
        echo "720p resolution not available. Downloading in 480p..."
        download_video "$url" 480
    fi
elif [ "$choice" = "2" ]; then
    download_playlist "$url"
else
    echo "Invalid choice. Please enter '1' or '2'."
fi
