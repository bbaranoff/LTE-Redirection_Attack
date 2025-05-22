#!/bin/bash
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null

if [[ -z $OSMO ]];then
  cd $MYPATH/osmocom_installation
  docker compose up --build
fi
