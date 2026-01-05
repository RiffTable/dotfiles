#!/bin/bash

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}'
}
is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

case $1 in
    UP)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    DOWN)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    MUTE)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
esac


if is_muted; then
    dunstify -h string:x-dunst-stack-tag:audio \
        "Volume Muted "
else
    dunstify -h string:x-dunst-stack-tag:audio \
        -h int:value:"$(get_volume)" \
        "Volume Changed"
fi








