#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default
CONFIG_HOME=~/.config
BOOKMARKS_HOME=$CONFIG_HOME/chromium/Default

source ./utils.sh

create_bookmark_folder() {
  if [ ! -d $BOOKMARKS_HOME ]; then
    mkdir -p $BOOKMARKS_HOME
    if [ ! -d $BOOKMARKS_HOME ]; then
      echo "Bookmark folder was not created: $BOOKMARKS_HOME"
      exit -1
    else
      echo "Bookmarks folder created. folder = $BOOKMARKS_HOME"
    fi
  fi
}

create_bookmark_folder

restore_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $BOOKMARKS_HOME/Bookmarks
