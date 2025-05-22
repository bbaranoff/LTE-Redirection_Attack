#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#


sudo apt install isc-dhcp-client docker.io docker-compose-v2 kconfig-frontends docker-buildx xterm shellinabox libbladerf2 tmux containerd -y
if [ ! -z $(ls .config 2>/dev/null) ] ; then
  mv .config .config.old;
fi
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null

sudo systemctl restart docker
sudo dhclient -r
sudo dhclient

cd $MYPATH
sudo bash ./osmocom.sh
sudo bash ./asterisk.sh
sudo bash ./openlte.sh

