#
# Copyright 2025  by Bastien Baranoff
#
FROM trx-example AS bts
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT

WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/osmo-bts
RUN cd /opt/GSM/osmo-bts && autoreconf -fi && ./configure --enable-trx && make -j$N  && make install && ldconfig

