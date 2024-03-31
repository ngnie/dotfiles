#!/bin/sh
echo " "
echo ">>> ip6tables rules"
echo " "
ip6tables -nvL
echo " "
echo ">>> service verification"
echo " "
systemctl --type=service | grep ip6tables
echo " "
echo ">>> service status: "
echo " "
systemctl status ip6tables
