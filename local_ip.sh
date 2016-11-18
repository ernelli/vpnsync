#!/bin/bash

IFLIST="eth0 br0 wlan0"

for IF in $IFLIST; do
#  echo Try interface: $IF
  INET=$(ip address show $IF | grep inet)
#  echo INET: $INET
  if [ "$INET" != "" ]; then
      ADDR=$(echo $INET | awk '{ print $2 }' | awk -F/ '{ print $1 }')
#      echo ADDR: $ADDR
      if [[ $ADDR == 192.168.* ]]; then
#	  echo FOUND local address: $ADDR
	  echo -n $ADDR
	  exit 0
      fi
      ADDR=""
  fi
done

exit 1
