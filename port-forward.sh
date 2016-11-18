#!/bin/bash

LOCAL_IP=$(./local_ip.sh)

echo Add port forward to $LOCAL_IP

upnpc -a $LOCAL_IP 10022 10022 TCP
upnpc -a $LOCAL_IP 11194 11194 UDP
