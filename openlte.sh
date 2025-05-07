#!/bin/bash
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null

cd openlte_redir_install
sudo docker compose up -d
