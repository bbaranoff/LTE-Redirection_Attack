sudo bash reset_tables.sh 
sudo bash dns_forward.sh
sudo srsepc_if_masq.sh enp114s0
echo nameserver 172.16.32.0  | sudo tee /etc/resolv.conf
echo nameserver 8.8.8.8 | sudo tee /etc/resolv.conf
