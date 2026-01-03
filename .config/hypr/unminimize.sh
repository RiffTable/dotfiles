#!/bin/bash

#   | "(\(.address)) \(.class): \(.title)\u0000icon\u001f\(.class)"' \

hyprctl clients -j | jq -r '.[] 
  | select(.workspace.name == "special:shadow") 
  | "\(.class): \(.title) (\(.address))\u0000icon\u001f\(.class)"' \
| rofi -dmenu \
    -i -show-icons \
    -p "What to un-minimize?" \
| rev \
| cut -c2-15 \
| rev \
| xargs -r -I % hyprctl dispatch movetoworkspace +0,address:%
# | xargs -r -I % rofi -e %
