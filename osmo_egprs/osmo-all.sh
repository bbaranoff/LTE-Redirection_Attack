#!/bin/bash
cmd="${1:-status}" 
set -ex
systemctl daemon-reload
systemctl $cmd osmo-hlr \
               osmo-msc \
               osmo-mgw \
               osmo-stp \
               osmo-bsc \
               osmo-ggsn \
               osmo-sgsn \
               osmo-sip-connector \
               osmo-bts \
               osmo-pcu
