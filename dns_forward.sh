iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -A POSTROUTING -o apn0 -t nat -s 192.168.1.1/24 -d 176.32.16.0/20 -j MASQUERADE
iptables -A POSTROUTING -o enp114s0 -t nat -s 176.16.32.0/20 ! -d 176.32.16.0/20 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
