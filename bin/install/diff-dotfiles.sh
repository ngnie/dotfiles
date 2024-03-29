#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_BOOKMARKS_HOME=$DOTFILES_HOME/.config/chromium/Default
BOOKMARKS_HOME=/home/nikolaj/.config/chromium/Default

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

diff_dotfile ~/.zshrc $DOTFILES_HOME/.zshrc
diff_dotfile ~/.xinitrc $DOTFILES_HOME/.xinitrc
diff_dotfile ~/.Xdefaults $DOTFILES_HOME/.Xdefaults
diff_dotfile ~/.xbindkeysrc $DOTFILES_HOME/.xbindkeysrc
diff_dotfile $BOOKMARKS_HOME/Bookmarks $DOTFILES_BOOKMARKS_HOME/Bookmarks
