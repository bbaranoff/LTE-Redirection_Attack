#
# Copyright 2025  by Bastien Baranoff
#
FROM ubuntu:22.04 as asterisk
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/
RUN apt update && apt install -y asterisk tmux vlc
ADD *.conf /etc/asterisk/
ADD ./run.sh /opt/
RUN sed -i 's/geteuid/getppid/' /usr/bin/vlc
