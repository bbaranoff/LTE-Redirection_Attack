
#
# Copyright 2025  by Bastien Baranoff
#
FROM ubuntu:22.04 AS osmocom
ARG DEBIAN_FRONTEND=noninteractive
ADD . /opt/GSM
WORKDIR /opt/GSM
RUN apt update
RUN apt install -y libedit-dev libfftw3-dev libusb-1.0-0-dev nano git liburing-dev libtool cmake autoconf make wget gcc g++ libpcsclite-dev pcsc-tools pcscd \
 cpufrequtils libsctp-dev libconfig++-dev libconfig-dev libmbedtls-dev libtalloc-dev libgnutls28-dev libmnl-dev libortp-dev libdbd-sqlite3 iproute2 tmux \
 iputils-ping libsqlite3-dev libtalloc-dev libortp-dev libdbi-dev libc-ares-dev libsofia-sip-ua-glib-dev telnet libuhd-dev uhd-host \
 python3-six python3-mako python3-lxml python3-lxml python3-numpy python3-numpy python3-pip git python3-pybind11 libsndfile1-dev libcurl4-openssl-dev
RUN apt install -y --no-install-recommends systemd systemd-sysv dbus dbus-user-session
RUN apt install -y autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml
RUN echo "export  UHD_MODULE_PATH=/usr/lib/uhd/modules" >> /root/.bashrc
RUN git clone https://github.com/nuand/BladeRF && cd /opt/GSM/BladeRF && mkdir build && cd build && cmake .. && make && make install && ldconfig 
ADD bladerf_osmo-trx.patch /opt/GSM
RUN apt install libbladerf-dev -y
RUN git clone https://github.com/osmocom/libosmocore
RUN cd /opt/GSM/libosmocore && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/libosmo-netif
RUN cd /opt/GSM/libosmo-netif && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/libosmo-abis
RUN cd /opt/GSM/libosmo-abis && autoreconf -fi && ./configure --disable-dahdi && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/osmo-hlr
RUN cd /opt/GSM/osmo-hlr && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/osmo-mgw
RUN cd /opt/GSM/osmo-mgw && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN git clone https://gitea.osmocom.org/osmocom/libosmo-sigtran
RUN cd /opt/GSM/libosmo-sigtran && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN wget https://obs.osmocom.org/projects/osmocom/public_key
RUN mv public_key /etc/apt/trusted.gpg.d/osmocom.asc
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/osmocom.asc] https://downloads.osmocom.org/packages/osmocom:/latest/xUbuntu_22.04 ./" | tee /etc/apt/sources.list.d/osmocom-latest.list
RUN apt-get update
RUN apt install libasn1c-dev libudev-dev dbus-bin libosmo-ranap-dev -y
RUN git clone https://github.com/osmocom/libgtpnl && cd libgtpnl &&autoreconf -fi && ./configure --enable-gtp-linux && make -j$N  && make install && ldconfig
RUN cd /opt/GSM/ 
RUN git clone https://github.com/osmocom/osmo-ggsn
RUN cd /opt/GSM/osmo-ggsn && autoreconf -fi && ./configure --enable-gtp-linux && make -j$N  && make install && ldconfig
RUN cd /opt/GSM/ 
RUN git clone https://github.com/osmocom/osmo-sgsn
RUN cd /opt/GSM/osmo-sgsn && autoreconf -fi && ./configure --enable-iu && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/libsmpp34
RUN cd /opt/GSM/libsmpp34 && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/osmo-msc
RUN cd /opt/GSM/osmo-msc && autoreconf -fi && ./configure --enable-smpp --enable-iu && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/osmo-bsc
RUN cd /opt/GSM/osmo-bsc && autoreconf -fi && ./configure --enable-iu && make -j$N  && make install && ldconfig
RUN git clone https://github.com/osmocom/osmo-sip-connector
RUN apt install iptables python3-pip udev -y
RUN cd /opt/GSM/osmo-sip-connector && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig
RUN pip3 install requests
RUN python3 /usr/lib/uhd/utils/uhd_images_downloader.py
RUN wget https://raw.githubusercontent.com/EttusResearch/uhd/refs/heads/master/host/utils/uhd-usrp.rules && cp uhd-usrp.rules /etc/udev/rules.d/
