#! /bin/sh
session="EGPRS"
window="$session:0"
if [ $(tmux attach -t "$session" )]; then
  exit 0
fi
tmux new-session -d -s "$session"
tmux send-keys -t "sleep 2" C-m

tmux send-keys -t "$window.0" "asterisk -cvvvvvvvvvv" C-m
tmux attach -t "$session"
