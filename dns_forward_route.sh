sudo iptables -t nat -I PREROUTING -i apn0 -p udp --dport 53 -j DNAT --to-dest 8.8.8.8
sudo iptables -t nat -A POSTROUTING -s 176.16.32.0/20 ! -o apn0 -j MASQUERADE
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
sudo ip route del default
sudo ip route add default via 192.168.1.254 dev enp114s0
echo nameserver 172.16.32.0 | sudo tee /etc/resolv.conf
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
