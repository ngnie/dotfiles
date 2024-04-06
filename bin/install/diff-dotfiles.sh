#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default
DOTFILES_TMUX_HOME=$DOTFILES_CONFIG_HOME/tmux
CONFIG_HOME=~/.config
CONFIG_BOOKMARKS_HOME=$CONFIG_HOME/chromium/Default
CONFIG_TMUX_HOME=$CONFIG_HOME/tmux

source ./utils.sh

diff_dotfile $DOTFILES_HOME/.zshrc ~/.zshrc
diff_dotfile $DOTFILES_HOME/.xinitrc ~/.xinitrc
diff_dotfile $DOTFILES_HOME/.Xdefaults ~/.Xdefaults
diff_dotfile $DOTFILES_HOME/.xbindkeysrc ~/.xbindkeysrc
diff_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $CONFIG_BOOKMARKS_HOME/Bookmarks
diff_folder $DOTFILES_CONFIG_HOME/lf $CONFIG_HOME/lf
diff_folder $DOTFILES_CONFIG_HOME/nvim $CONFIG_HOME/nvim
diff_dotfile $DOTFILES_TMUX_HOME/.tmux.conf $CONFIG_TMUX_HOME/.tmux.conf
