#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_DWM_HOME=$DOTFILES/usr/local/src/dwm
DOTFILES_SLSTATUS_HOME=$DOTFILES/usr/local/src/slstatus
DOTFILES_X11_HOME=$DOTFILES_HOME/etc/X11
X11_HOME=/etc/X11
DWM_HOME=/usr/local/src/dwm
SLSTATUS_HOME=/usr/local/src/slstatus

source ./utils.sh

diff_dotfile $DOTFILES_X11_HOME/xorg.conf $X11_HOME/xorg.conf
diff_dotfile $DOTFILES_DWM_HOME/config.h $DWM_HOME/config.h
diff_dotfile $DOTFILES_SLSTATUS_HOME/config.h $SLSTATUS_HOME/config.h
