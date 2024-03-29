#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_BOOKMARKS_HOME=$DOTFILES_HOME/.config/chromium/Default
BOOKMARKS_HOME=/home/nikolaj/.config/chromium/Default

source ./utils.sh

diff_dotfile ~/.zshrc $DOTFILES_HOME/.zshrc
diff_dotfile ~/.xinitrc $DOTFILES_HOME/.xinitrc
diff_dotfile ~/.Xdefaults $DOTFILES_HOME/.Xdefaults
diff_dotfile ~/.xbindkeysrc $DOTFILES_HOME/.xbindkeysrc
diff_dotfile $BOOKMARKS_HOME/Bookmarks $DOTFILES_BOOKMARKS_HOME/Bookmarks
