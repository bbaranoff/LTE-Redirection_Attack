#!/bin/bash
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda create -y -n py37 python=3.7
~/miniconda3/bin/conda init
source ~/.bashrc
~/miniconda3/bin/conda activate py37
