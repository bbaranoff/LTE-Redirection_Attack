#
# Copyright 2025  by Bastien Baranoff
#
#!/bin/sh
ip l del apn0
route=$(ip r | grep ^def | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])') 
echo nameserver $route > /etc/resolv.conf
ip tuntap add dev apn0 mode tun
ip addr add 176.16.32.0/28 dev apn0
ip addr add 2001:780:44:2100:0:0:0:0/56 dev apn0
ip link set apn0 up
