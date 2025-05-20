iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -A POSTROUTING -t nat -s 176.16.32.0/20 ! -d 176.32.16.0/20 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
sudo iptables -t nat -I PREROUTING -i apn0 -p udp --dport 53 -j DNAT --to-dest 192.168.1.254
