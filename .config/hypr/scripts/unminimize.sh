#!/bin/bash

#   | "(\(.address)) \(.class): \(.title)\u0000icon\u001f\(.class)"' \

hyprctl clients -j | jq -r '.[] 
  | select(.workspace.name == "special:shadow") 
  | "\(.class): \(.title) (\(.address))\u0000icon\u001f\(.class)"' \
| rofi -dmenu \
    -i -show-icons \
    -p "What to un-minimize?" \
| sed -n 's/.*(\(.*\))/\1/p' \
| xargs -r -I % hyprctl --batch \
  "dispatch movetoworkspace +0,address:%; \
  dispatch alterzorder top,address:%"
# | xargs -r -I % hyprctl dispatch movetoworkspace +0,address:%
# | xargs -r -I % rofi -e %
# | rev \
# | cut -c2-15 \
# | rev \
