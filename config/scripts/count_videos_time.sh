#!/bin/bash

parent_dir=$(wl-paste)

if [[ -z "$parent_dir" ]]; then
  echo "Clipboard is empty. Please copy a valid path to the clipboard."
  exit 1
fi

if [[ ! -d "$parent_dir" ]]; then
  echo "The clipboard content is not a valid directory: $parent_dir"
  exit 1
fi

total_seconds=0

while IFS= read -r -d '' file; do
  duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file" 2>/dev/null)
  if [[ "$duration" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    total_seconds=$(awk "BEGIN {print $total_seconds + $duration}")
  fi
done < <(find "$parent_dir" -type f \( \
  -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" -o \
  -iname "*.webm" -o -iname "*.flv" -o -iname "*.wmv" -o -iname "*.mpeg" -o \
  -iname "*.mpg" -o -iname "*.3gp" -o -iname "*.ogg" -o -iname "*.m4v" \) -print0)

total_hours=$(awk "BEGIN {printf \"%d\", $total_seconds / 3600}")
remaining_seconds=$(awk "BEGIN {print $total_seconds % 3600}")
total_minutes=$(awk "BEGIN {printf \"%d\", $remaining_seconds / 60}")
remaining_seconds=$(awk "BEGIN {printf \"%d\", $remaining_seconds % 60}")

if (( total_hours > 0 )); then
  printf "Total duration: %d hours, %d minutes, and %d seconds\n" "$total_hours" "$total_minutes" "$remaining_seconds"
else
  printf "Total duration: %d minutes and %d seconds\n" "$total_minutes" "$remaining_seconds"
fi

read -p "Press Enter to exit"
