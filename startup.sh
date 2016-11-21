#!/bin/bash

cd /home/pi/vpnsync

LOGFILE=./slack.pipe

sudo -u pi echo $(date) Starting up, running as $(whoami) starting slack logger > ./startup.log

./slack-logger.sh &

sudo -u pi echo $(date) Starting up, slack logger started, external ip $(external-ip) > $LOGFILE

#sudo -u pi ./ssh_agent.sh
#. /home/pi/agent.rc
#sync repo
#sudo -u pi git pull >> $LOGFILE

sudo -u pi ./port-forward.sh >> $LOGFILE
echo "bring br0 up..." >> $LOGFILE
ifup br0 >> $LOGFILE
echo "Start openvpn..." >> $LOGFILE
./openvpn.sh

#echo "Announce public IP..." >> $LOGFILE
#./announce.sh

echo "Alldone VPN node ready..." >> $LOGFILE
