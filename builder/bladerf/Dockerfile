#
# Copyright 2025  by Bastien Baranoff
#
FROM builder-example AS bladerf
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/GSM/
RUN echo "export  UHD_MODULE_PATH=/usr/lib/uhd/modules" >> /root/.bashrc

ARG BLADERF
RUN if [ "$BLADERF" = "y" ] ; then echo Building for b200 or ant \
&& git clone https://github.com/nuand/BladeRF \
&& cd /opt/GSM/BladeRF && mkdir build && cd build && cmake .. && make && make install && ldconfig ; fi
