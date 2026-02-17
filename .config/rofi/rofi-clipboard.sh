#!/bin/sh

cliphist list \
	| rofi -dmenu -p "clip" \
		-theme-str 'entry { placeholder: "Search clipboard..."; }' \
	| cliphist decode \
	| wl-copy
