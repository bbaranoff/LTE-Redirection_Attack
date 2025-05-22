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

for i in $(ls /sys/class/net/) ; do if [[ $i != "apn0" ]]; then /usr/bin/ip l del dev $i; fi ; done

sudo ./choose_interface.sh

sudo systemctl restart docker

sudo bash init_pyenv.sh
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
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash redir.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash asterisk.sh; exec bash"

cd $MYPATH
rm interface
for i in $(ls /sys/class/net/) ; do if [[ $i != "apn0" ]]; then /usr/bin/ip l del dev $i; fi ; done
sudo bash dns_forward.sh

# Put gateway IP in /etc/resolv.conf
route=$(ip r | grep ^def | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')
cat <<EOF > /etc/resolv.conf
nameserver $route
EOF


telnet 0 30001

