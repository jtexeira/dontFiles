#!/bin/bash
SCREEN=~/Pictures/Screenshot_"$(date '+%y-%m-%d_%H:%M')".png

SLURP="$(slurp)" || exit 1
grim -g "$SLURP" "$SCREEN"
wl-copy < "$SCREEN"
notify-send "Screenshot" "Screenshot saved to $SCREEN" -i "$SCREEN"
