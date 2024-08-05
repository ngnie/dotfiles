#!/bin/sh

DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus
DMENU_HOME=/usr/local/src/dmenu
SLOCK_HOME=/usr/local/src/slock

if [ -d $DWM_HOME ]; then
  echo "Folder $DWM_HOME already exist."
else
  mkdir -p $DWM_HOME
  cd $DWM_HOME
  git clone git://git.suckless.org/dwm .
fi

if [ -d $SLSTATUS_HOME ]; then
  echo "Folder $SLSTATUS_HOME already exist."
else
  mkdir -p $SLSTATUS_HOME
  cd $SLSTATUS_HOME
  git clone git://git.suckless.org/slstatus .
fi

if [ -d $DMENU_HOME ]; then
  echo "Folder $DMENU_HOME already exist."
else
  mkdir -p $DMENU_HOME
  cd $DMENU_HOME
  git clone git://git.suckless.org/dmenu .
fi

if [ -d $SLOCK_HOME ]; then
  echo "Folder $SLOCK_HOME already exist."
else
  mkdir -p $SLOCK_HOME
  cd $SLOCK_HOME
  git clone git://git.suckless.org/slock .
fi
