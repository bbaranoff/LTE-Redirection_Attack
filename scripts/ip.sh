ip tuntap add dev apn0 mode tun user nirvana group nirvana
ip addr add 172.16.32.0 dev apn0
ip link set mtu 1420 dev apn0
ip link set apn0 up
