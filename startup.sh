#!/bin/bash

cd /home/pi/vpnsync

sudo -u pi echo $(date) Starting up, running as $(whoami) > ./startup.log

sudo -u pi ./ssh_agent.sh
. /home/pi/agent.rc
#sync repo
sudo -u pi git pull >> ./startup.log
sudo -u pi ./port-forward.sh >> ./startup.log
echo "bring br0 up..." >> ./startup.log
ifup br0 >> ./startup.log
echo "Start openvpn..." >> ./startup.log
./openvpn.sh
echo "Announce public IP..." >> ./startup.log
./announce.sh
echo "Alldone VPN node ready..." >> ./startup.log
