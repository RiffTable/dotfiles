#!/usr/bin/env bash

hyprctl clients -j \
| jq -r '.[] 
  | select(.workspace.name == "special:magic")
  | "\(.address)\t\(.class): \(.title)"' \
| rofi -dmenu -i -p "magic" \
| cut -f1 \
| xargs -r hyprctl dispatch focuswindow address:

