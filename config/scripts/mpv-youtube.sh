#!/bin/bash

play_clipboard_url() {
    # Capture the URL from the clipboard
    url=$(xclip -o -selection clipboard)

    # Run mps-youtube to play the video
    mpsyt playurl "$url"
}

play_clipboard_url
