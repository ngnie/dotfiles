#!/bin/sh

IPTABLES_HOME=/etc/iptables
RULES_FILE=$IPTABLES_HOME/ip6tables.rules

if [ -f $RULES_FILE ]; then
  echo "Rules file already exists. Check it: $RULES_FILE"
  exit -1
fi

ip6tables-save > ip6tables.rules
mv ip6tables.rules $IPTABLES_HOME
if [ ! -f $RULES_FILE ]; then
  echo "Rules file not found. Check it: $RULES_FILE"
  exit -1
else
  echo "Rules file installed: $RULES_FILE"
fi

echo "Going to enable ip6tables..."
systemctl enable ip6tables

echo "Going to start ip6tables..."
systemctl start ip6tables
