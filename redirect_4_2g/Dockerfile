#
# Copyright 2025  by Bastien Baranoff
#
FROM openlte_redir_install-example AS redirect_4_2g
ARG DEBIAN_FRONTEND=noninteractive
RUN rm /usr/local/share/uhd/images/usrp_b210_fpga.bin
ADD /configs/libresdr_b220.bin /usr/local/share/uhd/images/usrp_b210_fpga.bin
WORKDIR /opt/GSM
ADD test.sh /opt/GSM
