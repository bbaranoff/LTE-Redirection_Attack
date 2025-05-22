#
# Copyright 2025  by Bastien Baranoff
#
FROM bsc-example AS sip
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM
RUN git clone https://github.com/osmocom/osmo-sip-connector
RUN apt install iptables python3-pip udev -y
RUN cd /opt/GSM/osmo-sip-connector && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN pip3 install requests
RUN python3 /usr/lib/uhd/utils/uhd_images_downloader.py
RUN wget https://raw.githubusercontent.com/EttusResearch/uhd/refs/heads/master/host/utils/uhd-usrp.rules && cp uhd-usrp.rules /etc/udev/rules.d/
