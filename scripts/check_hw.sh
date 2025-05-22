#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#
sudo kconfig-mconf builder/selected_stuff

if [ -z $(ls .config 2>/dev/null) ]; then exit;fi
source .config

HW=""

if [[ $CONFIG_HARDWARE != "y" ]]; then
    exit
fi

if [[ $CONFIG_HARDWARE_USRP_B200 == "y" ]]; then
    HW+=($HW "b200")
fi

if [[ $CONFIG_HARDWARE_ANTSDR == "y" ]]; then
    HW+=($HW "ant")
fi

if [[ $CONFIG_HARDWARE_LIMESDR == "y" ]]; then
    HW+=($HW "LimeSDR")
fi

if [[ $CONFIG_HARDWARE_BLADERF_XA4 == "y" ]]; then
    HW+=($HW "bladeRFxA4")
fi


if [[ -e myhwlist ]]; then
    rm myhwlist
fi
for element in "${HW[@]}"; do
    echo "$element" >> myhwlist
done
rm myhwlist

