#!/bin/bash

#  Copyright (C) 2018 Ron Wilhelmson <ron.wilhelmson@deltaww.com>
#
#  

##
## remote-onie-install 
##
## History: 12APR2018 Ron.Wilhelmson Initial Creation

# Dependencies: roi.cfg in same directory

# Set environment variables from roi.cfg for switch and server names/IPs
source ./scripts/roi.cfg

echo ""
echo "Target switch set to: $target_switch"
echo ""
echo "HTTP server set to: $http_server"
echo ""

echo "Sending install command to switch"

/usr/bin/ssh -a -l root $target_switch /bin/onie-nos-install http://"$http_server"/cumulus-linux-3.5.0-bcm-amd64.bin

echo "Waiting for onie to download and install"

sleep 60

echo "Rebooting switch"

/usr/bin/ssh -l root $target_switch /sbin/reboot

