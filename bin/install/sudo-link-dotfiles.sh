#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_DWM_HOME=$DOTFILES/usr/local/src/dwm
DOTFILES_SLSTATUS_HOME=$DOTFILES/usr/local/src/slstatus
DOTFILES_X11_HOME=$DOTFILES_HOME/etc/X11
X11_HOME=/etc/X11
DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus

source ./utils.sh

create_link $X11_HOME/xorg.conf $DOTFILES_X11_HOME/xorg.conf
create_link $DWM_HOME/config.h $DOTFILES_DWM_HOME/config.h
create_link $SLSTATUS_HOME/config.h $DOTFILES_SLSTATUS_HOME/config.h
