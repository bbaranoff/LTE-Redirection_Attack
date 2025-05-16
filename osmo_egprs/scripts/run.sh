tmux new-session -d -s "0"
tmux attach -t "0"
./runonce.sh
osmo-trx-uhd
