#!/usr/bin/env bash
#state: Shown 
#~/grv-dots/config/scripts/ocr.sh
# package need: yad, libnotify, grim, slurp, 
set -euo pipefail

lang="hin+eng"

notify() { command -v  notify-send >/dev/null && notify-send "$@" || true;}

trap 'notify -u  critical "OCR failed" "error near line $LINENO"' ERR

tmp="$(mktemp --suffix=.png)"
thumb="$(mktemp --suffix=.png)"
trap 'rm -f "$tmp" "$thumb"' EXIT

region="$(slurp -d -b '#00000066' -c '#ffffffff' -w 2)" || exit 0

grim -g "$region" "$tmp"

magick "$tmp" -resize '660x180>' "$thumb"

dark="$(magick "$tmp" -colorspace Gray -format '%[fx:mean<0.5?1:0])' info:)"

if [ "$dark" = "1" ]; then
    magick "$tmp" -resize 200% -colorspace Gray -negate -normalize "$tmp"
else
    magick "$tmp" -resize 200% -colorspace Gray  -normalize "$tmp"
fi

#OCR 
text="$(tesseract "$tmp" - -l "$lang" --psm 6 --dpi 300 2>/dev/null \
    | sed 's/[[:space:]]*$//'  | sed '/^$/d')"

[ -z "$text" ] && notify "OCR" "No text found" || true

edited="$(yad  --title="OCR" --class="ocr-yad" --name="ocr-yad"  \
    --center --width=700 --height=500 \
    --image="$thumb" --text-info --editable \
    --button="Copy:0" --button="Close:1" <<< "$text" 2>/dev/null)" || exit 0


if [[ -n "$edited" ]]; then
    printf '%s' "$edited" | wl-copy
    notify "OCR Copied" "${edited:0:200}"
else
    notify "OCR" "Nothing to copy"
fi


    

