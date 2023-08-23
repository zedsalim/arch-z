#!/bin/bash

play_clipboard_url() {
    # Capture the URL from the clipboard
    url=$(xclip -o -selection clipboard)

    # Run mpv with the URL using yt-dlp
    mpv --ytdl-format="best[height<=720]" "$url"
}

play_clipboard_url
