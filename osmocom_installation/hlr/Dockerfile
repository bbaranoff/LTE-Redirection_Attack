#
# Copyright 2025  by Bastien Baranoff
#
FROM libosmocore-example AS hlr
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/osmo-hlr
RUN cd /opt/GSM/osmo-hlr && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

