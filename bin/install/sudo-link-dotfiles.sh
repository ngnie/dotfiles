#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_DWM_HOME=$DOTFILES/usr/local/src/dwm
DOTFILES_SLSTATUS_HOME=$DOTFILES/usr/local/src/slstatus
DOTFILES_X11_HOME=$DOTFILES_HOME/etc/X11
X11_HOME=/etc/X11
DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus

create_link() {
  if [ -L $1 ]; then
    echo "Link already exist: $1"
  else
    if [ -f $1 ]; then
      echo "File already exist. Check it: $1"
    else
      ln -s $2 $1
      if [ -L $1 ]; then
        echo "Link created: $1"
      else
        echo "Link was not created. Check it: $1"
      fi
    fi
  fi
}

create_link $X11_HOME/xorg.conf $DOTFILES_X11_HOME/xorg.conf
create_link $DWM_HOME/config.h $DOTFILES_DWM_HOME/config.h
create_link $SLSTATUS_HOME/config.h $DOTFILES_SLSTATUS_HOME/config.h
