#!/bin/sh

DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus
DMENU_HOME=/usr/local/src/dmenu

if [ ! -d $DWM_HOME ]; then
  echo "Folder $DWM_HOME does not exist."
else
  cd $DWM_HOME
  make clean install
fi

if [ ! -d $SLSTATUS_HOME ]; then
  echo "Folder $SLSTATUS_HOME does not exist."
else
  cd $SLSTATUS_HOME
  make clean install
fi

if [ ! -d $DMENU_HOME ]; then
  echo "Folder $DMENU_HOME does not exist."
else
  cd $DMENU_HOME
  make clean install
fi

