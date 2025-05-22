#
# Copyright 2025  by Bastien Baranoff
#
FROM sgsn-example AS msc
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/libsmpp34
RUN cd /opt/GSM/libsmpp34 && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

RUN git clone https://github.com/osmocom/osmo-msc
RUN cd /opt/GSM/osmo-msc && autoreconf -fi && ./configure --enable-smpp --enable-iu && make -j$N  && make install && ldconfig

