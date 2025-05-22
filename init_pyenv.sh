#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
pushd $(dirname $0) > /dev/null
MYPATH=$PWD
popd > /dev/null
sudo apt install python3-venv
cd $MYPATH/scripts
sudo python3 -m venv myenv
source myenv/bin/activate
pip3 install telnetlib3
