#
# Copyright 2025  by Bastien Baranoff
#
FROM msc-example AS bsc
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/


RUN git clone https://github.com/osmocom/osmo-bsc
RUN cd /opt/GSM/osmo-bsc && autoreconf -fi && ./configure --enable-iu && make -j$N  && make install && ldconfig

