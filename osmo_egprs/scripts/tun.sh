#
# Copyright 2025  by Bastien Baranoff
#
#!/bin/sh
ip l del apn0
echo nameserver 1.1.1.1 > tee /etc/resolv.conf
echo nameserver 1.0.0.1 > tee /etc/resolv.conf
ip tuntap add dev apn0 mode tun
ip addr add 176.16.32.0/20 dev apn0
ip addr add 2001:780:44:2100::/56 dev apn0
ip link set apn0 up
