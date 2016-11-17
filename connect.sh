#!/bin/bash

git pull

REMOTE=`cat state/$1`

echo REMOTE IP: $REMOTE

openvpn --remote $REMOTE --cipher none --dev tap0 --port 11194
