#!/bin/sh

IPTABLES_HOME=/etc/iptables
RULES_FILE=$IPTABLES_HOME/ip6tables.rules

if [ -f $RULES_FILE ]; then
  echo "ERROR: rules file already exists. file = $RULES_FILE"
  exit -1
fi

ip6tables-save > ip6tables.rules
mv ip6tables.rules $IPTABLES_HOME
if [ ! -f $RULES_FILE ]; then
  echo "ERROR: rules file not found. file = $RULES_FILE"
  exit -1
else
  echo "Rules file installed. file = $RULES_FILE"
fi

echo "Going to Enable ip6tables [press Enter to continue]..." && read answer
systemctl enable ip6tables

echo "Going to Start ip6tables [press Enter to continue]..." && read answer
systemctl start ip6tables

echo "Going to verify [press Enter to continue]..." && read answer
echo "--------------------------------------------"
echo "ip6tables rules: "
ip6tables -nvL
echo "--------------------------------------------"
echo "Service verification: "
systemctl --type=service | grep ip6tables
echo "--------------------------------------------"
echo "Service status: "
systemctl status ip6tables
