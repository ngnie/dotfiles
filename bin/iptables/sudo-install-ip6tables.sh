#!/bin/sh

IPTABLES_HOME=/etc/iptables
RULES_FILE=$IPTABLES_HOME/ip6tables.rules
RULES_FILE_BAK=$IPTABLES_HOME/ip6tables.rules.bak

if [ -f $RULES_FILE_BAK ]; then
  echo "Rules bak file already exists. Check it: $RULES_FILE_BAK"
  exit -1
fi

if [ -f $RULES_FILE ]; then
  mv $RULES_FILE $RULES_FILE_BAK
  if [ -f $RULES_FILE_BAK ]; then
    echo "Rules bak file created: $RULES_FILE_BAK"
  else
    echo "Error: rules bak files does not exists: $RULES_FILE_BAK"
    exit -1
  fi
fi

ip6tables-save > ip6tables.rules
mv ip6tables.rules $IPTABLES_HOME
if [ -f $RULES_FILE ]; then
  echo "Rules file moved: $RULES_FILE"
else
  echo "Error: rules file not found: $RULES_FILE"
  exit -1
fi

echo "Going to enable ip6tables..."
systemctl enable ip6tables

echo "Going to start ip6tables..."
systemctl start ip6tables
