#!/bin/sh

CURRENT_FOLDER=.
TMUX_PLUGINS_TPM_HOME=~/.tmux/plugins/tpm

if [ -d $TMUX_PLUGINS_TPM_HOME ]; then
  echo "Folder $TMUX_PLUGINS_TPM_HOME already exist."
else
  mkdir -p $TMUX_PLUGINS_TPM_HOME
  cd $TMUX_PLUGINS_TPM_HOME
  git clone https://github.com/tmux-plugins/tpm .
  cd $CURRENT_FOLDER
fi
