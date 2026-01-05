#!/bin/bash

# Argument Checking
case $1 in
    UP)
        brightnessctl -e4 -n2 set 5%+
        TEXT="Brightness (+)"
        ;;
    DOWN)
        brightnessctl -e4 -n2 set 5%-
        TEXT="Brightness (-)"
        ;;
esac

# Send Notification
BRIGHTNESS=$(brightnessctl info | grep -oP '\(\K[^%]+')
dunstify -h string:x-dunst-stack-tag:brightness \
    -h int:value:"$BRIGHTNESS" \
    "$TEXT: $BRIGHTNESS"
