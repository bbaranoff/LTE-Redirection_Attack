iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -A POSTROUTING -o  enp114s0 -s 176.16.32.0/28 ! -d 176.16.32.0/28 -t nat -j MASQUERADE
ip6tables -A POSTROUTING -o  enp114s0 -s 2001:780:44:2100:0:0:0:0/56 ! -d 2001:780:44:2100:0:0:0:0/56 -t nat -j MASQUERADE
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1
