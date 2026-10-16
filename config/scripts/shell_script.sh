#!/usr/bin/env bash

set -eou pipefail

SCRIPTS_DIR="$HOME/grv-dots/config/scripts"
ICON_THEME="Papirus-dark"
DEFAULT_ICONS="utilities-termial"

name=()

for f in "$SCRIPTS_DIR"/*.sh; do
    [[ -x $f ]] || continue
    head -n 10 "$f" | grep -qiE '^#[[:space:]]*state:[[:space:]]*show' || continue
    name+=("$(basename "$f" .sh)")
done

if ((${#name[@]} == 0)); then 
    notify-send "Script menu" "No scripts are set to Shown"
    exit 0
fi

selected=$(printf '%s\n' "${name[@]}" | sort | rofi -dmenu -i -p "Run") || exit 0


[[ -n $selected ]] || exit 0

notify-send "Running" "$selected"
exec "$SCRIPTS_DIR/$selected.sh"