#!/usr/bin/env bash
#state: Shown 
#~/grv-dots/config/scripts/screenshot-area.sh

dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/shot_$(date +%F_%H-%M-%S).png"

geom=$(slurp -d -b '#00000066' -c '#ffffffff' -w 2) || exit 0

grim -t ppm -g "$geom" - \
    | satty --filename - --output-filename "$file" --early-exit \
    && [ -f "$file" ] && wl-copy --type  image/png < "$file"