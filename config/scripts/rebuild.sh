#!/usr/bin/env bash
set -eou pipefail

REPO="$HOME/grv-dots"
HOST="grv"

MSG="$*"
if [[ -z "$MSG" ]]; then
    echo "Ussage: $(basename "$0") <commit message>" >&2
    exit 1
fi

cd "$REPO"

#rebuilding system 

sudo nixos-rebuild switch --flake "$REPO#$HOST"

# commiting changes

git add -A
if git diff --cached --quiet; then 
    echo "Nothing to commit."
else 
    git commit -m "$MSG"
fi





