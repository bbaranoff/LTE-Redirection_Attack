#
# Copyright 2025  by Bastien Baranoff
#
FROM stp-example AS ggsn
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/
RUN wget https://obs.osmocom.org/projects/osmocom/public_key
RUN mv public_key /etc/apt/trusted.gpg.d/osmocom.asc
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/osmocom.asc] https://downloads.osmocom.org/packages/osmocom:/latest/xUbuntu_22.04 ./" | tee /etc/apt/sources.list.d/osmocom-latest.list
RUN apt-get update
RUN apt install libasn1c-dev libudev-dev dbus-bin libosmo-ranap-dev -y
RUN git clone https://github.com/osmocom/libgtpnl && cd libgtpnl &&autoreconf -fi && ./configure --enable-gtp-linux && make -j$N  && make install && ldconfig
RUN cd /opt/GSM/ 
RUN git clone https://github.com/osmocom/osmo-ggsn
RUN cd /opt/GSM/osmo-ggsn && autoreconf -fi && ./configure --enable-gtp-linux && make -j$N  && make install && ldconfig

