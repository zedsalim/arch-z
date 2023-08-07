
#!/bin/bash

cd /home/zed/Downloads/

# Function to download video or playlist
download() {
    local url="$1"
    local video_quality="$2"
    local audio_quality="$3"
    local output_format="$4"

    echo "Downloading..."
    yt-dlp -f "$video_quality+$audio_quality" -o "$output_format" "$url"
}

# Read the video URL from the clipboard
url=$(xclip -o -selection clipboard)

# Check for audio quality
audio="599"
yt-dlp -F "$url" | grep -q "599"
if [ $? -ne 0 ]; then
    audio="bestaudio"
fi

# Check for video quality options
video_quality="299"
output_format_video="%(title)s.%(ext)s"
output_format_playlist="%(playlist_index)s - %(title)s.%(ext)s"

yt-dlp -F "$url" | grep -q "299"
if [ $? -eq 0 ]; then
    echo "Do you want to download a single video or a playlist?"
    echo "Enter '1' for a single video or '2' for a playlist: "
    read choice

    if [ "$choice" = "1" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_video"
    elif [ "$choice" = "2" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_playlist"
    else
        echo "Invalid choice. Please enter '1' or '2'."
    fi
elif yt-dlp -F "$url" | grep -q "302"; then
    video_quality="302"
    echo "Do you want to download a single video or a playlist?"
    echo "Enter '1' for a single video or '2' for a playlist: "
    read choice

    if [ "$choice" = "1" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_video"
    elif [ "$choice" = "2" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_playlist"
    else
        echo "Invalid choice. Please enter '1' or '2'."
    fi
else
    echo "Quality options not available. Downloading best available quality..."
    video_quality="bestvideo"
    echo "Do you want to download a single video or a playlist?"
    echo "Enter '1' for a single video or '2' for a playlist: "
    read choice

    if [ "$choice" = "1" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_video"
    elif [ "$choice" = "2" ]; then
        download "$url" "$video_quality" "$audio" "$output_format_playlist"
    else
        echo "Invalid choice. Please enter '1' or '2'."
    fi
fi
