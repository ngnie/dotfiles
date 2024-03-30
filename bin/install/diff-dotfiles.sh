#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_BOOKMARKS_HOME=$DOTFILES_HOME/.config/chromium/Default
BOOKMARKS_HOME=/home/nikolaj/.config/chromium/Default

source ./utils.sh

diff_dotfile $DOTFILES_HOME/.zshrc ~/.zshrc
diff_dotfile $DOTFILES_HOME/.xinitrc ~/.xinitrc
diff_dotfile $DOTFILES_HOME/.Xdefaults ~/.Xdefaults
diff_dotfile $DOTFILES_HOME/.xbindkeysrc ~/.xbindkeysrc
diff_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $BOOKMARKS_HOME/Bookmarks
