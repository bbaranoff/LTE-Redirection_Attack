old_route=$(cat route)

# Put gateway IP in /etc/resolv.conf
echo $(ip r | grep ^def | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+') > route
route=$(sed 's/ .*//g' route)

echo $route > route
bash ./tun.sh
operator=$(cat operator)
if [[ $operator = "free" ]];then
sed -i -e "s/network code .*/network code 15/g" /etc/osmocom/osmo-bsc.cfg
sed -i -e "s/network code .*/network code 15/g" /etc/osmocom/osmo-msc.cfg
fi
if [[ $operator = "bouygues" ]];then
sed -i -e "s/network code .*/network code 20/g" /etc/osmocom/osmo-bsc.cfg
sed -i -e "s/network code .*/network code 20/g" /etc/osmocom/osmo-msc.cfg
fi
if [[ $operator = "sfr" ]];then
sed -i -e "s/network code .*/network code 10/g" /etc/osmocom/osmo-bsc.cfg
sed -i -e "s/network code .*/network code 10/g" /etc/osmocom/osmo-msc.cfg
fi
if [[ $operator = "orange" ]];then
sed -i -e "s/network code .*/network code 01/g" /etc/osmocom/osmo-bsc.cfg
sed -i -e "s/network code .*/network code 01/g" /etc/osmocom/osmo-msc.cfg
fi
sed -i -e "s/`echo $old_route`/`echo $route`/g" /etc/osmocom/osmo-ggsn.cfg
sed -i -e 's/network-online.target/nss-lookup.target/g' /lib/systemd/system/osmo-*.service
sed -i -e 's/ser=osmocom/ser=root/g' /lib/systemd/system/osmo-*.service
sed -i -e 's/oup=osmocom/oup=root/g' /lib/systemd/system/osmo-*.service
./osmo-all.sh stop
./osmo-all.sh start

