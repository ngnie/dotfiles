#!/bin/sh

IPTABLES_HOME=/etc/iptables
RULES_FILE=$IPTABLES_HOME/iptables.rules

if [ -f $RULES_FILE ]; then
  echo "ERROR: rules file already exists. file = $RULES_FILE"
  exit -1
fi

iptables-save > iptables.rules
mv iptables.rules $IPTABLES_HOME
if [ -f $RULES_FILE ]; then
  echo "ERROR: rules file not found. file = $RULES_FILE"
  exit -1
else
  echo "Rules file installed. file = $RULES_FILE"
fi

echo "Going to Enable iptables [press Enter to continue]..." && read answer
systemctl enable iptables

echo "Going to Start iptables [press Enter to continue]..." && read answer
systemctl start iptables
