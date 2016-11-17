#!/bin/bash

apt-get install openvpn
apt-get install miniupnpc
apt-get install bridge-utils
apt-get install git
apt-get install libssl-dev


git clone https://github.com/AGWA/git-crypt.git
cd git-crypt
make
make install


