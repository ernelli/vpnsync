#!/bin/bash

nohup sudo openvpn --dev tap0 --cipher none --port 11194 >> openvpn.log &
