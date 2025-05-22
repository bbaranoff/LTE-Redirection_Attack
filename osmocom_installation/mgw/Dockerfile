#
# Copyright 2025  by Bastien Baranoff
#
FROM hlr-example AS mgw
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://github.com/osmocom/osmo-mgw
RUN cd /opt/GSM/osmo-mgw && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

