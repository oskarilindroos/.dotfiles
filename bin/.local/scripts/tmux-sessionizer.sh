#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    # Find all git repos in my directories and pipe them to fzf for selection
    selected=$(find ~/ ~/Documents/School ~/Documents/Personal -mindepth 0 -maxdepth 4 -name "*.git" -type d -exec dirname {} \; | fzf --preview 'tree -aC {}' --border)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
