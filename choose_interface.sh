#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#

kconfig-mconf run_menu
sed -i -e '/^#/d' .config
sed -i -e 's/CONFIG_//g' .config
sed -i -e 's/=y//g' .config
cp .config osmo_egprs/configs/operator
mv .config scripts/operator

dhclient -r
dhclient
ip -o link show | awk -F': ' '{print $2}' > interfaces
sed -i -e 's/@.*//g' interfaces
echo "choice" > interfaces_menu
echo "prompt \"Network interface\"" >> interfaces_menu
echo "        default interface" >> interfaces_menu
echo "        help" >> interfaces_menu
echo "          Specify the interface you will use to forward internet with OSMOCOM" >> interfaces_menu
cat interfaces | while read line
do
echo "config $line" >> interfaces_menu
echo "        bool" >> interfaces_menu
echo "        prompt \"Interface $line\"" >> interfaces_menu
echo "        select interface" >>  interfaces_menu
done
echo "endchoice" >> interfaces_menu
kconfig-mconf interfaces_menu
sed -i -e '/^#/d' .config
sed -i -e 's/CONFIG_//g' .config
sed -i -e 's/=y//g' .config
mv .config interface
monip=$(ip -f inet addr show $(cat interface) | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')
sed -i -e "s/$(cat ipdev)/$monip/g" osmo_egprs/configs/*cfg
sed -i -e "s/$(cat ipdev)/$monip/g" asterisk/sip.conf
echo $monip > ipdev
rm interfaces*
