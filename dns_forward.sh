bash reset_tables.sh
iptables -t nat -A POSTROUTING -o enp114s0 --src 176.16.32.0/20 --dst 0.0.0.0/0 -j MASQUERADE
iptables -t nat -I PREROUTING -i enp114s0 --src 192.168.1.1/24 --dst 172.16.32.0/20
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward 1>/dev/null



