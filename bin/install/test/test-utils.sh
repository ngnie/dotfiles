#!/bin/sh

UTILS_FILE=../utils.sh
DOTFILES_HOME=~/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config

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

if [ ! -d $TEST_CONFIG_HOME ]; then
  mkdir $TEST_CONFIG_HOME
fi

################################
# create_file_link
#
# file link already exists
ln -s $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
create_file_link $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -L $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file link should exist"
fi
rm $TEST_TMP_HOME/.xinitrc

# file already exists
touch $TEST_TMP_HOME/.xinitrc
create_file_link $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -f $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file should exist"
fi
rm $TEST_TMP_HOME/.xinitrc

# file link created
create_file_link $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -L $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file link not created"
fi
rm $TEST_TMP_HOME/.xinitrc


################################
# create_folder_link
#
# folder link already exist
ln -s $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
create_folder_link $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -L $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder link should exist"
fi
rm $TEST_CONFIG_HOME/lf

# folder already exist
mkdir $TEST_CONFIG_HOME/lf
create_folder_link $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -d $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder should exist"
fi
rmdir $TEST_CONFIG_HOME/lf

# folder link created
create_folder_link $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -L $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder link not created"
fi
rm $TEST_CONFIG_HOME/lf


################################
# diff_dotfile
#
# file link already exist
ln -s $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
diff_dotfile $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -L $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file link should exist"
fi
rm $TEST_TMP_HOME/.xinitrc

# file is equal
cp $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
diff_dotfile $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -f $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file should exist"
fi
rm $TEST_TMP_HOME/.xinitrc

# file has difference
cp $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
echo "a difference" >> $TEST_TMP_HOME/.xinitrc
diff_dotfile $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ ! -f $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file should exist"
fi
rm $TEST_TMP_HOME/.xinitrc

# file does not exist
diff_dotfile $DOTFILES_HOME/.xinitrc $TEST_TMP_HOME/.xinitrc
if [ -f $TEST_TMP_HOME/.xinitrc ]; then
  echo "Assert: file should not exist (also check for link)"
fi


################################
# diff_folder
#
# folder link already exist
ln -s $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
diff_folder $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -L $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder link should exist"
fi
rm $TEST_CONFIG_HOME/lf

