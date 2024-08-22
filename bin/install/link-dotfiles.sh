#!/bin/sh

DOTFILES_HOME=/home/nikolaj/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default
DOTFILES_ALACRITTY_HOME=$DOTFILES_CONFIG_HOME/alacritty
DOTFILES_PICOM_HOME=$DOTFILES_CONFIG_HOME/picom
DOTFILES_LAZYGIT_HOME=$DOTFILES_CONFIG_HOME/lazygit
CONFIG_HOME=~/.config
CONFIG_ALACRITTY_HOME=$CONFIG_HOME/alacritty
CONFIG_PICOM_HOME=$CONFIG_HOME/picom
CONFIG_LAZYGIT_HOME=$CONFIG_HOME/lazygit

source ./utils.sh

create_folder $CONFIG_ALACRITTY_HOME
create_folder $CONFIG_PICOM_HOME
create_folder $CONFIG_LAZYGIT_HOME

create_file_link $DOTFILES_HOME/.zshrc ~/.zshrc
create_file_link $DOTFILES_HOME/.xinitrc ~/.xinitrc
create_file_link $DOTFILES_HOME/.Xdefaults ~/.Xdefaults
create_file_link $DOTFILES_HOME/.xbindkeysrc ~/.xbindkeysrc
create_folder_link $DOTFILES_CONFIG_HOME/lf $CONFIG_HOME/lf
create_folder_link $DOTFILES_CONFIG_HOME/nvim $CONFIG_HOME/nvim
create_file_link $DOTFILES_HOME/.tmux.conf ~/.tmux.conf
create_file_link $DOTFILES_ALACRITTY_HOME/alacritty.toml $CONFIG_ALACRITTY_HOME/alacritty.toml
create_file_link $DOTFILES_PICOM_HOME/picom.conf $CONFIG_PICOM_HOME/picom.conf
create_file_link $DOTFILES_LAZYGIT_HOME/config.yml $CONFIG_LAZYGIT_HOME/config.yml
