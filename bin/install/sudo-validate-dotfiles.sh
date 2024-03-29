#!/bin/sh

X11_HOME=/etc/X11
DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles

if [ -f $X11_HOME/xorg.conf ]; then
  # mv $X11_HOME/xorg.conf $X11_HOME/xorg.conf.bak
  echo "/etc/X11/xorg.conf.bak created"
fi
# ln -s $DOTFILES_HOME/etc/X11/xorg.conf $X11_HOME/xorg.conf
