#!/bin/bash
# Copied from A Reddit Post & Comment: https://www.reddit.com/r/unixporn/comments/1lm4mh1/comment/n055hdm/

WALLPAPER_DIR="$HOME/.config/hypr/wallpaper/"

set_wallpaper_with_awww() {
	# --- Function to initiate awww and set the wallpaper with animation ---
    local wallpaper_path="$1"
    local monitor_name="eDP-1"    # Set your monitor name here, e.g., "eDP-1", "DP-1"

    # Start awww daemon if it's not running
    if ! pgrep -x "awww-daemon" > /dev/null; then
        echo "Starting awww-daemon..."
        awww-daemon &
        sleep 0.5 # Give it a moment to initialize
    fi

    echo "Setting wallpaper with awww: $wallpaper_path"
    # Example transitions. Experiment with different options!
    # -t: transition type (e.g., wipe, grow, outer, random)
    # -d: transition duration in seconds
    # -f: transition fps
    # --invert: invert the transition direction

    # Some common and nice-looking transitions:
    # awww img "$wallpaper_path" -o "$monitor_name" --transition-type wipe --transition-duration 0.8 --transition-fps 60

    # If you want to apply to all monitors without specifying each:
    awww img "$wallpaper_path" --transition-type grow --transition-duration 1 --transition-fps 60

    echo "Wallpaper set with animation."
}



###===== MAIN SCRIPT LOGIC =====###

NEW_WALLPAPER=""

if [ -z "$1" ]; then
    # No path given, choose randomly
    echo "No wallpaper path provided. Choosing randomly from $WALLPAPER_DIR..."
    if [ -d "$WALLPAPER_DIR" ]; then
        NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) | shuf -n 1)
        if [ -z "$NEW_WALLPAPER" ]; then
            echo "Error: No suitable image files found in $WALLPAPER_DIR."
            exit 1
        fi
    else
        echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist."
        exit 1
    fi
else
    # Path given as a parameter
    NEW_WALLPAPER="$1"
    if [ ! -f "$NEW_WALLPAPER" ]; then
        echo "Error: The provided path is not a valid file: $NEW_WALLPAPER"
        exit 1
    fi
fi

echo "Selected wallpaper: $NEW_WALLPAPER"

set_wallpaper_with_awww "$NEW_WALLPAPER"
