#!/bin/bash

DIR="$HOME/.config/hypr/wallpaper/"

# Get Random Background Image
CURR=$(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

read SW SH <<< "$(awww query | grep -oP '\d+x\d+' | head -n1 | tr 'x' ' ')"
read IW IH <<< "$(identify -format '%w %h' "$CURR")"

awww img "$CURR" --transition-type wipe --transition-fps 60
