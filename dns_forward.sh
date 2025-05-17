iptables -t mangle -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t nat -A POSTROUTING -o enp114s0 --src 176.16.32.0/20 --dst 0.0.0.0/0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward



