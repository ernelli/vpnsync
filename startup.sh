#!/bin/bash

cd /home/pi/vpnsync

echo Running as $(whoami) during startup > ./startup.log

return 0

./ssh_agent.sh
. /home/pi/agent.rc
git pull
./port-forward.sh
ifup br0
./open-vpn.sh
./announce.sh
