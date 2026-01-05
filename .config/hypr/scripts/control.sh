#!/bin/bash

# All Possible Arguments
# V_DOWN, V_UP, V_MUTE
# B_DOWN, B_UP
# WALLPAPER

get_brightness() {
    brightnessctl info | grep -oP '\(\K[^%]+'
}
get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}'
}
is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}



TEXT=""
MODE="BAR"
BAR_VALUE=0



# Argument Checking
case $1 in

    #===== VOLUME =====#
    V_UP)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        BAR_VALUE=$(get_volume)
        TEXT="Volume (+): $BAR_VALUE"
        TAG=audio
        ;;
    V_DOWN)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        BAR_VALUE=$(get_volume)
        TEXT="Volume (-): $BAR_VALUE"
        TAG=audio
        ;;
    V_MUTE)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if $(is_muted); then
            TEXT="Volume Muted "; MODE="MSG"
        else
            BAR_VALUE=$(get_volume)
            TEXT="Volume Unmuted: $BAR_VALUE"
        fi
        TAG=audio
        ;;
     
    #===== BRIGHTNESS =====#
    B_UP)
        brightnessctl -e4 -n2 set 5%+
        BAR_VALUE=$(get_brightness)
        TEXT="Brightness (+): $BAR_VALUE"
        TAG=brightness
        ;;
    B_DOWN)
        brightnessctl -e4 -n2 set 5%-
        BAR_VALUE=$(get_brightness)
        TEXT="Brightness (-): $BAR_VALUE"
        TAG=brightness
        ;;
esac



# Send Notification
if [ "$MODE" == "MSG" ]; then
    dunstify -h string:x-dunst-stack-tag:"$TAG" \
        "$TEXT"
else
    dunstify -h string:x-dunst-stack-tag:"$TAG" \
        -h int:value:"$BAR_VALUE" \
        "$TEXT"
fi

