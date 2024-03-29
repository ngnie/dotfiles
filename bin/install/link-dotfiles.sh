#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_BOOKMARKS_HOME=$DOTFILES_HOME/.config/chromium/Default
BOOKMARKS_HOME=/home/nikolaj/.config/chromium/Default

create_bookmark_folder() {
  if [ ! -d $BOOKMARKS_HOME ]; then
    mkdir $BOOKMARKS_HOME
    if [ -d $BOOKMARKS_HOME ]; then
      echo "Bookmark folder was not created: $BOOKMARKS_HOME"
      exit -1
    fi
  fi
}

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

create_bookmark_folder

create_link ~/.zshrc $DOTFILES_HOME/.zshrc
create_link ~/.xinitrc $DOTFILES_HOME/.xinitrc
create_link ~/.Xdefaults $DOTFILES_HOME/.Xdefaults
create_link ~/.xbindkeysrc $DOTFILES_HOME/.xbindkeysrc
create_link $BOOKMARKS_HOME/Bookmarks $DOTFILES_BOOKMARKS_HOME/Bookmarks
