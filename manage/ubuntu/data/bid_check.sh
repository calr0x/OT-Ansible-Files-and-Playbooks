#!/bin/bash

# This script checks for bids the last 15 minutes
BIDS=$(docker logs --since 15m otnode | grep Accepting | wc -l)

if [ $BIDS -eq 0 ]; then
  /root/OT-Ansible-Files-and-Playbooks/manage/data/send.sh "Has not bid in the last 15 minutes"
fi
