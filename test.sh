iptables -t mangle -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t nat -A POSTROUTING -o apn0 --src 176.16.32.0/28 ! --dst 176.16.32.0/28 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
