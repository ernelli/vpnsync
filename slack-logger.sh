#!/bin/bash

. ./slack.rc

#echo slack: $SLACK

if [ ! -e slack.pipe ]; then
    mkfifo slack.pipe
fi

while [ true ]; do
  MSG=$(cat ./slack.pipe | sed -e 's|\"|\\"|g')
  JSON="{ \"text\" : \"$MSG\" }"
  wget -q -O /dev/null --post-data="payload=$JSON" $SLACK
done

