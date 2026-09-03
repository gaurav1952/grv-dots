#!/usr/bin/env bash

session=$(
    tmux list-sessions -F "#{session_name}" 2>/dev/null \
    | rofi -dmenu -p "Tmux Sessions"
)

[ -z "$session" ] && exit 0

ghostty -e bash -lc "tmux attach-session -t '$session'"
