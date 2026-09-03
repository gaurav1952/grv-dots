#!/usr/bin/env bash

PROJECTS="$HOME/Projects"

project=$(
    find "$PROJECTS" -mindepth 1 -maxdepth 1 -type d \
    | while read -r dir; do
        basename "$dir"
      done \
    | sort \
    | rofi -dmenu -p "Projects"
)

[ -z "$project" ] && exit 0

project_dir="$PROJECTS/$project"

ghostty -e bash -lc "tmux new-session -A -s '$project' -c '$project_dir'"
