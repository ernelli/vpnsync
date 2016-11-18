#!/bin/bash

ssh-agent > /home/pi/agent.rc

. /home/pi/agent.rc

ssh-add /home/pi/.ssh/rspi1.key
