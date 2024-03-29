#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus
BOOKMARKS_HOME=/home/nikolaj/.config/chromium/Default

validate() {
  if [ -f $1 ]; then
    diff $1 $2 > /dev/null 2>&1
    error=$?
    if [ $error -eq 0 ]; then
      echo "File is up to date: $1"
    elif [ $error -eq 1 ]; then
      echo "File has difference. Check it: $1"
    else
      echo "Diff call failed: $2"
    fi
  else
    echo "File does not exist: $1"
  fi
}

validate ~/.zshrc $DOTFILES_HOME/.zshrc
validate ~/.xinitrc $DOTFILES_HOME/.xinitrc
validate ~/.Xdefaults $DOTFILES_HOME/.Xdefaults
validate ~/.xbindkeysrc $DOTFILES_HOME/.xbindkeysrc
validate $BOOKMARKS_HOME/Bookmarks $DOTFILES_HOME/.config/chromium/Default/Bookmarks
validate $DWM_HOME/config.h $DOTFILES_HOME/usr/local/src/dwm/config.h
validate $SLSTATUS_HOME/config.h $DOTFILES_HOME/usr/local/src/slstatus/config.h
