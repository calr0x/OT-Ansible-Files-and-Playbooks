#!/bin/bash

echo $HOSTNAME >> file

echo "source /root/OT-Settings/config.sh"
source /root/OT-Settings/config.sh

echo "/root/OT-Smoothbrain-Backup/restic snapshots -H $HOSTNAME | grep $HOSTNAME | cut -c1-8 | tail -n 1"
SNAPSHOT=$(/root/OT-Smoothbrain-Backup/restic snapshots -H $HOSTNAME | grep $HOSTNAME | cut -c1-8 | tail -n 1)

echo $SNAPSHOT >> file