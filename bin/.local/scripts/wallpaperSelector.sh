#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Create a list of image files (without the path)
FILES=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) -printf "%f\n")

# Use tofi to select a file
SELECTED_FILE=$(echo "$FILES" | tofi)

# If a file was selected, set the wallpaper
if [ -n "$SELECTED_FILE" ]; then
    FULL_PATH=$(find "$WALLPAPER_DIR" -type f -name "$SELECTED_FILE")
    swww img "$FULL_PATH" --resize fit --fill-color ffffff --transition-type center
    notify-send "Wallpaper changed!" "New wallpaper set to $SELECTED_FILE"
else
    notify-send "Wallpaper not changed" "No wallpaper selected."
fi
