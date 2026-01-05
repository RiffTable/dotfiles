#!/bin/bash

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}'
}
is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

# Argument Checking
case $1 in
    UP)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        TEXT="Volume (+)"
        ;;
    DOWN)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        TEXT="Volume (-)"
        ;;
    MUTE)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        TEXT="Volume Unmuted"
        ;;
esac

# Send Notification
VOLUME=$(get_volume)
if is_muted; then
    dunstify -h string:x-dunst-stack-tag:audio \
        "Volume Muted "
else
    dunstify -h string:x-dunst-stack-tag:audio \
        -h int:value:"$VOLUME" \
        "$TEXT: $VOLUME"
fi
