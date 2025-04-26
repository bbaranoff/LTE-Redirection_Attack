#
# Copyright 2025  by Bastien Baranoff
#
sudo docker run -it --privileged -v /dev:/dev --cap-add=all --device /dev/bus/usb:/dev/bus/usb --device /dev/net/tun:/dev/net/tun --net host --cgroupns=host --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup osmo_egprs-example ./run.sh
