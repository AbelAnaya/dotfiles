#!/usr/bin/env bash

DIRECTORIES="$HOME/ $HOME/workspace"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find $DIRECTORIES -mindepth 1 -maxdepth 1 -type d 2> /dev/null)
    selected+=$'\n'
    selected+=$(find $DIRECTORIES -mindepth 2 -maxdepth 2 -type d -exec test -f '{}/.git' ';' -print 2> /dev/null)
    selected=$(echo "$selected" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

echo $selected
echo $selected_name
echo $tmux_running

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]] ; then
    tmux attach -t $selected_name
else
    tmux switch-client -t $selected_name
fi
