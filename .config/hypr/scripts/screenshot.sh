#!/bin/bash

# Freeze the screen
hyprpicker -r -z & 
FREEZE_PID=$!

# Rofi panel
choice=$(echo -e "󰆟 Region\n󱂬 Window\n󰹑 Screen" | rofi -dmenu -theme ~/.config/rofi/themes/panel.rasi -i)


kill $FREEZE_PID
case $choice in
    *Region) grimblast save area ;;
    *Window) grimblast save active ;;
    *Screen) grimblast save screen ;;
esac

# # FUCKED
# case $choice in
#     Region)
#         # 3. Use slurp with -d to show dimensions
#         # -b sets background color (e.g., a subtle blue overlay)
#         GEOM=$(slurp -d -b "#89b4fa44")
#         if [ -n "$GEOM" ]; then
#             grim -g "$GEOM" ~/Pictures/$(date +%Y%m%d_%H%M%S).png
#         fi
#         ;;
#     Window)
#         # Capture the active window via Hyprland socket
#         GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
#         grim -g "$GEOM" ~/Pictures/$(date +%Y%m%d_%H%M%S).png
#         ;;
#     Full)
#         grim ~/Pictures/$(date +%Y%m%d_%H%M%S).png
#         ;;
# esac
