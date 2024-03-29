#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_DWM_HOME=$DOTFILES/usr/local/src/dwm
DOTFILES_SLSTATUS_HOME=$DOTFILES/usr/local/src/slstatus
DOTFILES_X11_HOME=$DOTFILES_HOME/etc/X11
X11_HOME=/etc/X11
DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus

diff_dotfile() {
  if [ -L $1 ]; then
    echo "Link already exist: $1"
  else
    if [ -f $1 ]; then
      diff $1 $2 > /dev/null 2>&1
      error=$?
      if [ $error -eq 0 ]; then
        echo "File is equal: $1"
      elif [ $error -eq 1 ]; then
        echo "File has difference: $1"
        diff $1 $2
      else
        echo "Diff call failed: $1"
      fi
    else
      echo "File does not exist: $1"
    fi
  fi
}

diff_dotfile $X11_HOME/xorg.conf $DOTFILES_X11_HOME/xorg.conf
diff_dotfile $DWM_HOME/config.h $DOTFILES_DWM_HOME/config.h
diff_dotfile $SLSTATUS_HOME/config.h $DOTFILES_SLSTATUS_HOME/config.h
