#!/bin/bash

#!/bin/bash

MAC=`ip link show eth0 | grep ether | awk '{ print $2 }'| sed -e "s/://g"`
ID=`echo -n $MAC | sha1sum | awk '{ print $1 }'`
IP=`external-ip`

echo MAC: $MAC
echo IP: $IP
echo ID: $ID

echo $IP > state/$ID

git add state/
git commit -m "Update state" state/
git push
