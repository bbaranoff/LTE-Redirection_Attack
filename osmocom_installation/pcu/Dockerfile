#
# Copyright 2025  by Bastien Baranoff
#
FROM bts-example AS pcu
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/osmo-pcu
RUN cd /opt/GSM/osmo-pcu && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

