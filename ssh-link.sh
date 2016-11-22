#!/bin/bash

. sshlink.rc
. /home/pi/agent.rc
LOGFILE=./slack.pipe

while [ true ]; do

ssh -N -R localhost:$LINK_PORT:localhost:10022 $LINK_SERVER > $LOGFILE

echo "ssh failed, wait 60s, retry" > $LOGFILE
sleep 60
echo "retry..." > $LOGFILE
done
