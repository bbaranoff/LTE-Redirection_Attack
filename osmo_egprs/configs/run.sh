#! /bin/sh
session="EGPRS"
window="$session:0"
if [ $(tmux attach -t "$session" )]; then
  exit 0
fi
tmux new-session -d -s "$session"
tmux send-keys -t "$window.0" "cd /etc/osmocom" C-m
tmux send-keys -t "$window.0" "./runonce.sh" C-m
tmux send-keys -t "$window.0" "osmo-trx-uhd -a \"name=LibreSDR\"" C-m
tmux attach -t "$session"
