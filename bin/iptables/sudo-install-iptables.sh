#!/bin/sh

IPTABLES_HOME=/etc/iptables
RULES_FILE=$IPTABLES_HOME/iptables.rules

if [ -f $RULES_FILE ]; then
  echo "Rules file already exists. Check it: $RULES_FILE"
  exit -1
fi

iptables-save > iptables.rules
mv iptables.rules $IPTABLES_HOME
if [ -f $RULES_FILE ]; then
  echo "Rules file not found. Check it: $RULES_FILE"
  exit -1
else
  echo "Rules file installed: $RULES_FILE"
fi

echo "Going to enable iptables..."
sudo systemctl enable iptables

echo "Going to start iptables..."
sudo systemctl start iptables
