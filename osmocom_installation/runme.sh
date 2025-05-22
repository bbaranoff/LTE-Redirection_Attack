#!/bin/bash
#
# Copyright 2025  by Bastien Baranoff
#

./osmo-all.sh stop
./tun.sh
./osmo-all.sh start

