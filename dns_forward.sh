sudo bash reset_tables.sh
#sudo iptables -t nat -I PREROUTING -i apn0 -p udp --dport 53 -j DNAT --to-dest 1.1.1.1
sudo iptables -t nat -A POSTROUTING -s 176.16.32.0/20 -o enp114s0 -j MASQUERADE
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
