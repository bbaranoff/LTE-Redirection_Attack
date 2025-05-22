#
# Copyright 2025  by Bastien Baranoff
#
FROM ggsn-example AS sgsn
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/osmo-sgsn
RUN cd /opt/GSM/osmo-sgsn && autoreconf -fi && ./configure --enable-iu && make -j$N  && make install && ldconfig

