#!/bin/bash

#   | "(\(.address)) \(.class): \(.title)\u0000icon\u001f\(.class)"' \

hyprctl clients -j | jq -r '.[] 
  | select(.workspace.name == "special:shadow") 
  | "\(.class): \(.title) (\(.address))\u0000icon\u001f\(.class)"' \
| rofi -dmenu \
    -i -show-icons \
	-theme-str 'entry { placeholder: "What to un-minimize?"; }' \
    -p "unmin" \
| sed -n 's/.*(\(.*\))/\1/p' \
| xargs -r -I % hyprctl dispatch movetoworkspace +0,address:%
# | xargs -r -I % rofi -e %
# | rev \
# | cut -c2-15 \
# | rev \
