#!/usr/bin/env bash
#state: Shown 
#~/grv-dots/config/scripts/screenshot.sh

dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/shot_$(date +%F_%H-%M-%S).png"

grim -t ppm  - \
    | satty --filename - --output-filename "$file" --early-exit \
    && [ -f "$file" ] && wl-copy --type  image/png < "$file"