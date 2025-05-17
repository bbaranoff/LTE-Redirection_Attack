#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#

echo "Have fun..."
sudo docker run -it --net=host -d -v /dev:/dev --privileged --device /dev/bus/usb:/dev/bus/usb -v /dev:/dev redirect_4_2g-example LTE_fdd_enodeb
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null
cd $MYPATH
python3 -m venv myenv
source myenv/bin/activate
pip3 install telnetlib3
if [[ -n $(grep orange=y operator) ]];then
python3 telnet_orange.py
elif [[ -n $(grep sfr=y operator) ]];then
python3 telnet_sfr.py
elif [[ -n$(grep free=y operator) ]];then
python3 telnet_free.py
elif [[ -n $(grep bouygues=y operator) ]];then
python3 telnet_bouygues.py
elif [[ -n $(grep lyca=y operator) ]];then
python3 telnet_bouygues.py
fi
telnet 0 30000
