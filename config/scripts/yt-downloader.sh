
#!/bin/bash

cd /home/zed/Downloads/

# Function to prompt user for choice
get_choice() {
    local choice
    read -p "Do you want to download a single video or a playlist? (1/2): " choice
    echo "$choice"
}

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

# Get available formats
available_formats=$(yt-dlp -F "$url")

# Check for audio quality
audio="599"
if ! echo "$available_formats" | grep -q "599"; then
    audio="bestaudio"
fi

# Check for video quality options
output_format_video="%(title)s.%(ext)s"
output_format_playlist="%(playlist_index)s - %(title)s.%(ext)s"

choice=$(get_choice)

case "$choice" in
    1)
        if echo "$available_formats" | grep -q "299"; then
            download "$url" "299" "$audio" "$output_format_video"
        elif echo "$available_formats" | grep -q "302"; then
            download "$url" "302" "$audio" "$output_format_video"
        else
            download "$url" "bestvideo" "$audio" "$output_format_video"
        fi
        ;;
    2)
        if echo "$available_formats" | grep -q "299"; then
            download "$url" "299" "$audio" "$output_format_playlist"
        elif echo "$available_formats" | grep -q "302"; then
            download "$url" "302" "$audio" "$output_format_playlist"
        else
            download "$url" "bestvideo" "$audio" "$output_format_playlist"
        fi
        ;;
    *)
        echo "Invalid choice. Please enter '1' or '2'."
        ;;
esac
