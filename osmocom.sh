#!/bin/bash
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null

cd $MYPATH/builder && docker compose up --build -d

cd $MYPATH/builder/bladerf
docker compose up --build -d



if [[ -z $OSMO ]];then
  cd $MYPATH/osmocom_installation/libosmocore
  docker compose up --build
  cd $MYPATH/osmocom_installation/hlr
  docker compose up --build
  cd $MYPATH/osmocom_installation/mgw
  docker compose up --build
  cd $MYPATH/osmocom_installation/stp
  docker compose up --build
  cd $MYPATH/osmocom_installation/ggsn
  docker compose up --build
  cd $MYPATH/osmocom_installation/sgsn
  docker compose up --build
  cd $MYPATH/osmocom_installation/msc
  docker compose up --build
  cd $MYPATH/osmocom_installation/bsc
  docker compose up --build
  cd $MYPATH/osmocom_installation/sip
  docker compose up --build
  cd $MYPATH/osmocom_installation/trx
  docker compose up --build
  cd $MYPATH/osmocom_installation/bts
  docker compose up --build
  cd $MYPATH/osmocom_installation/pcu
  docker compose up --build
fi
