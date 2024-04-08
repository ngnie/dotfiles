#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default
DOTFILES_ALACRITTY_HOME=$DOTFILES_CONFIG_HOME/alacritty
CONFIG_HOME=~/.config
CONFIG_ALACRITTY_HOME=$CONFIG_HOME/alacritty

source ./utils.sh

create_file_link $DOTFILES_HOME/.zshrc ~/.zshrc
create_file_link $DOTFILES_HOME/.xinitrc ~/.xinitrc
create_file_link $DOTFILES_HOME/.Xdefaults ~/.Xdefaults
create_file_link $DOTFILES_HOME/.xbindkeysrc ~/.xbindkeysrc
create_folder_link $DOTFILES_CONFIG_HOME/lf $CONFIG_HOME/lf
create_folder_link $DOTFILES_CONFIG_HOME/nvim $CONFIG_HOME/nvim
create_file_link $DOTFILES_HOME/.tmux.conf ~/.tmux.conf
create_file_link $DOTFILES_ALACRITTY_HOME/alacritty.toml $CONFIG_ALACRITTY_HOME/alacritty.toml
