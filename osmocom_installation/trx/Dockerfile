#
# Copyright 2025  by Bastien Baranoff
#
FROM sip-example AS trx
ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT
WORKDIR /opt/GSM/
ADD bladerf_osmo-trx.patch /opt/GSM
ARG USRP
ARG LIMESDR
ARG BLADERF

RUN if [ "$USRP" = "y" ] && [ "$LIMESDR" != "y" ]; then git clone https://github.com/osmocom/osmo-trx \
&& cd /opt/GSM/osmo-trx && autoreconf -fi && ./configure --with-uhd && make -j$N  && make install && ldconfig ; fi

RUN if [ "$USRP" != "y" ] && [ "$LIMESDR" = "y" ]; then git clone https://github.com/osmocom/osmo-trx \
&& cd /opt/GSM/osmo-trx && autoreconf -fi && ./configure --with-lms && make -j$N  && make install && ldconfig ; fi

RUN if [ "$USRP" = "y" ] && [ "$LIMESDR" = "y" ]; then git clone https://github.com/osmocom/osmo-trx \
&& cd /opt/GSM/osmo-trx && autoreconf -fi && ./configure --with-lms --with-uhd && make -j$N  && make install && ldconfig ; fi

RUN if [ "$BLADERF" = "y" ]; then  cd /opt/GSM/osmo-trx && ./configure --with-bladerf && make -j$N  && make install && ldconfig; fi

