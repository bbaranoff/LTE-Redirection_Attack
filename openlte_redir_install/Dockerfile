#
# Copyright 2025  by Bastien Baranoff
#
FROM ubuntu:18.04 AS openlte_redir_install
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /opt/GSM/
RUN apt update
RUN apt install -y build-essential libgmp-dev libx11-6 libx11-dev\
 libcurl4-openssl-dev curl flex libncurses5 libncurses5-dev libncursesw5 libpcsclite-dev\
 zlib1g-dev libmpfr6 libmpc3 lemon aptitude libtinfo-dev libtool\
 shtool autoconf git-core pkg-config make libmpfr-dev libmpc-dev\
 libtalloc-dev libfftw3-dev libgnutls28-dev libssl-dev libtool-bin\
 libxml2-dev sofia-sip-bin libsofia-sip-ua-dev sofia-sip-bin libncursesw5-dev\
 bison libgmp3-dev alsa-oss asn1c libdbd-sqlite3 libboost1.65-all-dev libusb-1.0-0-dev\
 python3-mako python-mako doxygen python3-docutils cmake build-essential g++\
 python-cheetah libpython-dev python3-numpy python3-numpy swig libsqlite3-dev libi2c-dev python-numpy\
 libwxgtk3.0-gtk3-dev freeglut3-dev composer phpunit python3-pip python-pip curl
RUN pip install requests


#4G Redirect


#Clone or download the necessary repositories :

RUN git clone https://github.com/ettusresearch/uhd
RUN cd uhd/host && git checkout v3.15.0.0-rc3 && mkdir build && cd build && cmake -DENABLE_PYTHON3=OFF .. && make -j16 && make install && ldconfig
RUN apt install wget software-properties-common -y
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt-get update
RUN apt install cmake -y

RUN git clone https://github.com/nuand/BladeRF
RUN cd BladeRF && git checkout libbladeRF_v2.4.1 && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig

RUN git clone https://github.com/pothosware/SoapySDR
RUN cd SoapySDR && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig

RUN git clone https://github.com/pothosware/SoapyBladeRF
RUN cd SoapyBladeRF && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig

RUN git clone https://github.com/pothosware/SoapyUHD
RUN cd SoapyUHD && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig

RUN apt -y install gnuradio


RUN git clone https://github.com/osmocom/gr-osmosdr
RUN cd gr-osmosdr &&  git checkout gr3.7 && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig
RUN git clone  https://github.com/cuberite/polarssl
RUN cd polarssl && git checkout 47431b6 && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig

RUN git clone https://git.code.sf.net/p/openlte/code openlte
ADD uhd.patch /opt/GSM
RUN mv uhd.patch /opt/GSM/openlte
RUN cd openlte && git checkout a5a66e && patch -p1 < uhd.patch && mkdir build && cd build && cmake .. && make -j$N && make install && ldconfig


RUN pip3 install requests
RUN python3 /usr/local/lib/uhd/utils/uhd_images_downloader.py










