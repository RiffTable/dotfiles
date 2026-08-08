#!/bin/bash


# 1. Lists all windows in the shadow space
# 2. Lists them using rofi
# 3. Gets the window address from user-selection
# 4. Moves the selected window to active workspace



hyprctl clients -j | jq -r '.[] 
  | select(.workspace.name == "special:shadow") 
  | "\(.class): \(.title) (\(.address))\u0000icon\u001f\(.class)"' \
| rofi -dmenu \
    -i -show-icons \
	-theme-str 'entry { placeholder: "What to un-minimize?"; }' \
    -p "unmin" \
| tr -d '\000' | grep -oE '0x[0-9a-fA-F]+' \
| xargs -r -I % hyprctl dispatch 'hl.dsp.window.move({ workspace = hl.get_active_workspace().id, window = "address:%" })'

# | xargs -r -I % hyprctl dispatch movetoworkspace +0,address:%



# Debug

# | sed -n 's/.*(\(.*\))/\1/p' \
# | sed -n 's/.*(\(0x[a-fA-F0-9]*\)).*/\1/p' \

# | xargs -r -I % rofi -e % \ Debug using rofi error panel

# | rev \
# | xargs -r -I % rofi -e % \    # Debug using rofi error panel
# > ~/src/temp.txt

# hyprctl dispatch 'hl.dsp.window.move({ window = "address:0x5571222a5e80", workspace = $active_ws })'
# hyprctl dispatch 'hl.dsp.window.move({ workspace = hl.get_active_workspace().id, window = "address:0x5571222209a0" })'
