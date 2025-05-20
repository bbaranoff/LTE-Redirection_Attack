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
sudo systemctl restart networkd-dispatcher
sudo systemctl stop udev systemd-udevd-control.socket systemd-udevd-kernel.socket
sudo systemctl restart docker
sudo bash init_pyenv.sh
sudo dhclient -r
sudo dhclient
cd $MYPATH/osmo_egprs/
sudo docker compose up --force-recreate --build -d
cd $MYPATH/redirect_4_2g
sudo docker compose up --force-recreate --build -d
cd $MYPATH/asterisk/
sudo docker compose up --force-recreate --build -d
cd  $MYPATH


cd $MYPATH/scripts
gnome-terminal -- bash -c "bash 2G.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash redir.sh; exec bash"
cd $MYPATH/scripts
gnome-terminal -- bash -c "bash asterisk.sh; exec bash"
cd $MYPATH
sudo bash dns_forward.sh
#sudo bash srsepc_if_masq.sh $(cat interface)
cat <<EOF > /etc/resolv.conf
nameserver 192.168.1.254
nameserver 212.27.40.240
EOF
for i in $(ls /sys/class/net/) ; do if [[ $i != "apn0" ]]; then /usr/bin/ip l del dev $i; fi ; done


telnet 0 30001
sudo systemctl start udev systemd-udevd-control.socket systemd-udevd-kernel.socket

