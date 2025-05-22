iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -A POSTROUTING -o  enp114s0 -s 172.17.0.2/16 ! -d 172.17.0.2/16 -t nat -j MASQUERADE
sudo sysctl -w net.ipv4.ip_forward=1
