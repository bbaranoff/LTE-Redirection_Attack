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

sudo udevadm trigger
sudo modprobe gtp

sudo ./choose_interface.sh

sudo systemctl restart docker
sudo dhclient -r
sudo dhclient

# Rebuild Dockers
cd $MYPATH/osmo_egprs/
sudo docker compose up --force-recreate --build -d
cd $MYPATH/redirect_4_2g
sudo docker compose up --force-recreate --build -d
cd $MYPATH/asterisk/
sudo docker compose up --force-recreate --build -d

# Execute Dockers
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash 2G.sh; exec bash"
sleep 1
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash redir.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash asterisk.sh; exec bash"

cd $MYPATH
rm interface

# Put gateway IP in /etc/resolv.conf
echo $(ip r | grep ^def | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') > route
route=$(sed 's/ .*//g' route)
cat <<EOF > /etc/resolv.conf
nameserver $route
EOF

#sudo ip r add 192.168.1.23 via 176.16.32.0
sudo bash dns_forward.sh
