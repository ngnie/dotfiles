#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_BOOKMARKS_HOME=$DOTFILES_HOME/.config/chromium/Default
DOTFILES_LF_HOME=$DOTFILES_HOME/.config/lf
BOOKMARKS_HOME=~/.config/chromium/Default
LF_HOME=~/.config/lf

source ./utils.sh

create_bookmark_folder() {
  if [ ! -d $BOOKMARKS_HOME ]; then
    mkdir $BOOKMARKS_HOME
    if [ -d $BOOKMARKS_HOME ]; then
      echo "Bookmark folder was not created: $BOOKMARKS_HOME"
      exit -1
    fi
  fi
}


create_bookmark_folder

create_file_link $DOTFILES_HOME/.zshrc ~/.zshrc
create_file_link $DOTFILES_HOME/.xinitrc ~/.xinitrc
create_file_link $DOTFILES_HOME/.Xdefaults ~/.Xdefaults
create_file_link $DOTFILES_HOME/.xbindkeysrc ~/.xbindkeysrc
create_file_link $DOTFILES_BOOKMARKS_HOME/Bookmarks $BOOKMARKS_HOME/Bookmarks
create_folder_link $DOTFILES_LF_HOME $LF_HOME
