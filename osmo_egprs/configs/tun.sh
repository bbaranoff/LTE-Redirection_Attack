#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#
#!/bin/sh
ip tuntap add dev free mode tun
ip addr add 176.16.32.0/20 dev free
ip addr add 2001:780:44:2100::/56 dev free
ip link set free up
