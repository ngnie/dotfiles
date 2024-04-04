#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default
CONFIG_HOME=~/.config
CONFIG_BOOKMARKS_HOME=$CONFIG_HOME/chromium/Default

source ./utils.sh

create_folder $CONFIG_BOOKMARKS_HOME

restore_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $CONFIG_BOOKMARKS_HOME/Bookmarks
