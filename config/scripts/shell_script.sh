#!/usr/bin/env bash

SCRIPTS_DIR="$HOME/grv-dots/config/scripts"

selected=$(find -L "$SCRIPTS_DIR" -maxdepth 1 -type f -executable -printf '%f\n' | sort | rofi -dmenu -p "Run: ")

[ -n "$selected" ] && exec "$SCRIPTS_DIR/$selected"
