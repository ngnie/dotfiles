#!/bin/sh
echo " "
echo ">>> iptables rules"
echo " "
iptables -nvL
echo " "
echo ">>> service verification"
echo " "
systemctl --type=service | grep iptables
echo " "
echo ">>> service status"
echo " "
systemctl status iptables
