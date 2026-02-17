#!/bin/bash

shutdown='󰐥 Shutdown'
reboot='󰜉 Reboot'
lock='󰌾 Lock'
suspend='󰤄 Suspend'
logout='󰍃 Logout'

CHOSEN=$(echo -e "$shutdown\n$reboot\n$suspend\n$logout\n$lock" | \
	rofi -dmenu -i -p "power" \
	-config "$HOME"/.config/rofi/panel.rasi \
	-theme-str 'entry { placeholder: "Power Menu:"; }')

# echo "$CHOSEN"

case "$CHOSEN" in
    "$shutdown") systemctl poweroff ;;
    "$reboot")   systemctl reboot ;;
    "$suspend")  systemctl suspend ;;
    "$logout")   hyprctl dispatch exit ;;
    "$lock")     hyprlock ;;
	*)           exit 1 ;;
esac
