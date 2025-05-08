#
# Copyright 2025  by Bastien Baranoff
#
FROM ubuntu:22.04 AS builder
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT=1
ADD . /opt/GSM
WORKDIR /opt/GSM
RUN apt update
RUN apt install -y libedit-dev libfftw3-dev libusb-1.0-0-dev nano git liburing-dev libtool cmake autoconf make wget gcc g++ libpcsclite-dev pcsc-tools pcscd \
 cpufrequtils libsctp-dev libconfig++-dev libconfig-dev libmbedtls-dev libtalloc-dev libgnutls28-dev libmnl-dev libortp-dev libdbd-sqlite3 iproute2 tmux \
 iputils-ping libsqlite3-dev libtalloc-dev libgnutls28-dev libmnl-dev libortp-dev libdbi-dev libc-ares-dev libsofia-sip-ua-glib-dev telnet libuhd-dev uhd-host
RUN apt install -y --no-install-recommends systemd systemd-sysv dbus dbus-user-session
RUN apt install -y autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml


