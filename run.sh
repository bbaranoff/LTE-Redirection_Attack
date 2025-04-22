#!/bin/bash

#
# Copyright 2025  by Bastien Baranoff
#
# Check for sudo rights
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null

myuser=$(who am i | awk '{print $1}')
sudo bash srsran_performance
read -p "Forwarding Interface, device ? " interface
sudo bash srsepc_if_masq.sh interface
read -p "Forwarding Interface, ip ? " ipin
sudo sed -i -e "s/0 remote ip 127.0.0.1/0 remote ip `echo $ipin`/g" osmo_egprs/configs/osmo-bsc.cfg
sudo sed -i -e "s/listen 127.0.0.1/listen `echo $ipin`/g" osmo_egprs/configs/osmo-sgsn.cfg
read -p "Restart docker: [Y/n]: " restart_docker
if [ -z $restart_docker ]; then restart_docker="Y";fi
if [ $restart_docker != "n" ]; then sudo systemctl restart docker;fi
cd $MYPATH
sudo udevadm trigger
sudo ./choose_interface.sh
sudo modprobe gtp
sudo systemctl stop udev systemd-udevd-control.socket systemd-udevd-kernel.socket
cd $MYPATH/osmo_egprs/
sudo docker compose up --build -d
cd $MYPATH/redirect_4_2g
sudo docker compose up --build -d
cd $MYPATH/asterisk/
sudo docker compose up --build -d
cd $MYPATH/scripts
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash 2G.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash redir.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash asterisk.sh; exec bash"
cd $MYPATH/scripts
telnet 172.17.0.2 30001

