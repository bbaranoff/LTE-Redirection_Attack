#
# Copyright 2024  by Penthertz (Bastien Baranoff)
#
FROM pcu-example as osmo_egprs
ARG DEBIAN_FRONTEND=noninteractive
ADD libresdr_b210.bin /usr/share/uhd/images/usrp_b210_fpga.bin
WORKDIR /etc/osmocom
ADD /scripts/entrypoint.sh /entrypoint.sh
ADD /configs/operator /etc/osmocom/.
ADD /scripts/*.sh /etc/osmocom/.
RUN sed -i -e 's/network-online.target/nss-lookup.target/g' /lib/systemd/system/osmo-*.service
RUN sed -i -e 's/ser=osmocom/ser=root/g' /lib/systemd/system/osmo-*.service
ADD /configs/*.cfg /etc/osmocom/.
ADD /scripts/.config /etc/osmocom/.
ADD /configs/osmo-mgw.service /lib/systemd/system/.
ADD /configs/osmo-trx.service /lib/systemd/system/.
ADD /configs/osmo-bts.service /lib/systemd/system/.
ADD /configs/osmo-pcu.service /lib/systemd/system/.
RUN systemctl mask systemd-logind.service getty.service getty.target
RUN /lib/systemd/systemd-udevd --daemon
RUN udevadm monitor &
RUN cp /usr/local/bin/osmo* /usr/bin/
ENTRYPOINT ["/entrypoint.sh"]
