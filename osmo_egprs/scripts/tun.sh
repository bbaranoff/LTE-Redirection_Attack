#
# Copyright 2025  by Bastien Baranoff
#
#!/bin/sh
ip l del apn0

# Put gateway IP in /etc/resolv.conf
echo $(ip r | grep ^def | cat testr | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') > route
route=$(sed 's/ .*//g' route)

echo nameserver $route > /etc/resolv.conf
ip tuntap add dev apn0 mode tun
ip addr add 176.16.32.0/28 dev apn0
ip addr add 2001:780:44:2100:0:0:0:0/56 dev apn0
ip link set apn0 up
