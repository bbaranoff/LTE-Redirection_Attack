#
# Copyright 2025  by Bastien Baranoff
#
FROM ubuntu:22.04 as asterisk
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/
RUN apt update && apt install -y asterisk
ADD *.conf /etc/asterisk/
