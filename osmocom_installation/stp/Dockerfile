#
# Copyright 2025  by Bastien Baranoff
#
FROM mgw-example AS stp
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/

RUN git clone https://gitea.osmocom.org/osmocom/libosmo-sigtran
RUN cd /opt/GSM/libosmo-sigtran && autoreconf -fi && ./configure && make -j$N  && make install && ldconfig

