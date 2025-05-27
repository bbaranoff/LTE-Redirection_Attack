#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#

echo "Have fun..."
sudo docker run -it -v /dev:/dev --privileged --device /dev/bus/usb:/dev/bus/usb -v /dev:/dev redirect_4_2g-app bash
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null
cd $MYPATH
operator=$(cat operator)
python3 -m venv myenv
source myenv/bin/activate
python3 -m pip install telnetlib3
cd $MYPATH
if [[ $operator = "orange" ]];then
python3 telnet_orange.py
fi
if [[ $operator = "sfr" ]];then
python3 telnet_sfr.py
fi
if [[ $operator = "free" ]];then
python3 telnet_free.py
fi
if [[ $operator = "bouygues" ]];then
python3 telnet_bouygues.py
fi
#! /bin/sh
session="eNodeB Redirection"
if [[ $(tmux attach -t "$session") ]]; then
  exit 0
fi
tmux new-session -d -s "$session"
window=0
tmux rename-window -t $window 'Log'
tmux send-keys -t $window "telnet 172.17.0.2 30001" C-m
tmux attach -t "$session"
cd $MYPATH
rm -r myenv
