#!/usr/bin/sh

# CONFIG
SAVE_DIR=/home/zed/Downloads/
# END CONFIG

# LANGUAGE STRINGS
lang_scr_whole="📷 Screenshot of whole screen"
lang_scr_fragment="📷 Screenshot of selected region"

lang_delay="⏰ Delay:"
lang_nodelay="🕰 No delay"

lang_save_jpg="🖼️ Save as jpg"
lang_copy_clipboard="🖼️ Copy to clipboard"

lang_copied="Screenshot copied to clipboard"
lang_saved="Screenshot saved to file"
# END OF LANGUAGE STRINGS

# Selecting delay
rofi_delay=$(
    printf "%s 1s\n%s 3s\n%s 5s\n%s 10s\n%s\n" \
           "$lang_delay" "$lang_delay" "$lang_delay" "$lang_delay" "$lang_nodelay" |
    rofi -dmenu -p "screenshot" -lines 5
) || exit 2

# Selecting save method
rofi_save_method=$(
    printf "%s\n%s\n" "$lang_save_jpg" "$lang_copy_clipboard" |
    rofi -dmenu -p "screenshot" -lines 2
) || exit 3

# Selecting screenshot type
rofi_scr_type=$(
    printf "%s\n%s\n" "$lang_scr_whole" "$lang_scr_fragment" |
    rofi -dmenu -p "screenshot" -lines 2
) || exit 4

# Adding delay if selected
if [ "$rofi_delay" = "$lang_delay 1s" ]; then
    sleep 1
elif [ "$rofi_delay" = "$lang_delay 3s" ]; then
    sleep 3
elif [ "$rofi_delay" = "$lang_delay 5s" ]; then
    sleep 5
elif [ "$rofi_delay" = "$lang_delay 10s" ]; then
    sleep 10
fi

# Taking screenshot
filename="Screenshot $(date '+%Y-%m-%d, %H-%M-%S').jpg"
filepath="$SAVE_DIR/$filename"

if [ "$rofi_scr_type" = "$lang_scr_fragment" ]; then
    flameshot gui -r > "$filepath"
else
    flameshot full -r > "$filepath"
fi

# Handling save method
if [ "$rofi_save_method" = "$lang_copy_clipboard" ]; then
    xclip -selection clipboard -t "image/jpeg" -i "$filepath"
    notify-send "$lang_copied"
else
    notify-send "$lang_saved" "$filepath"
fi
