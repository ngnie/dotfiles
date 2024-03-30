#!/bin/sh

UTILS_FILE=../utils.sh
DOTFILES_HOME=~/ngr/engineer/repos/dotfiles
TEST_HOME=$DOTFILES_HOME/bin/install/test
TEST_TMP_HOME=$TEST_HOME/tmp
TEST_CONFIG_HOME=$TEST_TMP_HOME/.config

if [ ! $UTILS_FILE ]; then
  echo "$UTILS_FILE file not found"
  exit -1
else
  source $UTILS_FILE
fi

if [ ! -d $TEST_TMP_HOME ]; then
  mkdir $TEST_TMP_HOME
fi

################################
# create_file_link
#
# file link already exists

ln -s $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
create_folder_link $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc

rm $TEST_TMP_HOME/.xinitrc

if [ ! -d $TEST_CONFIG_HOME ]; then
  mkdir $TEST_CONFIG_HOME
fi

