sudo bash reset_tables.sh
sudo iptables -t nat -I PREROUTING -i apn0 -p udp --dport 53 -j DNAT --to-dest 1.1.1.1
sudo iptables -t nat -A POSTROUTING -o enp114s0  --src 176.16.32.0/20 --dst 0.0.0.0/0 -j MASQUERADE
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward 1>/dev/null
