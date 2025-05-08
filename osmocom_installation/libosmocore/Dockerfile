#
# Copyright 2025  by Bastien Baranoff
#
FROM bladerf-example AS libosmocore
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/
RUN apt install libbladerf-dev -y
RUN git clone https://github.com/osmocom/libosmocore
RUN cd /opt/GSM/libosmocore && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

RUN git clone https://github.com/osmocom/libosmo-netif
RUN cd /opt/GSM/libosmo-netif && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

RUN git clone https://github.com/osmocom/libosmo-abis
RUN cd /opt/GSM/libosmo-abis && autoreconf -fi && ./configure --disable-dahdi && make -j$N  && make install && ldconfig


