#!/bin/sh

UTILS_FILE=../utils.sh
DOTFILES_HOME=~/ngr/engineer/repos/dotfiles
DOTFILES_CONFIG_HOME=$DOTFILES_HOME/.config
DOTFILES_BOOKMARKS_HOME=$DOTFILES_CONFIG_HOME/chromium/Default

TEST_HOME=$DOTFILES_HOME/bin/install/test
TEST_TMP_HOME=$TEST_HOME/tmp
TEST_CONFIG_HOME=$TEST_TMP_HOME/.config
TEST_CONFIG_LF_HOME=$TEST_TMP_HOME/.config/lf
TEST_CONFIG_BOOKMARKS_HOME=$TEST_TMP_HOME/.config/chromium/Default

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

# folder is equal
mkdir $TEST_CONFIG_HOME/lf
cp $DOTFILES_CONFIG_HOME/lf/* $TEST_CONFIG_HOME/lf
diff_folder $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -d $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder should exist"
fi
rm $TEST_CONFIG_LF_HOME/lfrc
rm $TEST_CONFIG_LF_HOME/preview.sh
rmdir $TEST_CONFIG_HOME/lf

# folder has difference
mkdir $TEST_CONFIG_HOME/lf
cp $DOTFILES_CONFIG_HOME/lf/* $TEST_CONFIG_HOME/lf
echo "a difference" >> $TEST_CONFIG_LF_HOME/lfrc
echo "a new file" > $TEST_CONFIG_LF_HOME/aNewFile.txt
echo "a new hidden file" > $TEST_CONFIG_LF_HOME/.aNewFile.txt
diff_folder $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ ! -d $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder should exist"
fi
if [ ! -f $TEST_CONFIG_LF_HOME/aNewFile.txt ]; then
  echo "Assert: aNewFile.txt should exist"
fi
if [ ! -f $TEST_CONFIG_LF_HOME/.aNewFile.txt ]; then
  echo "Assert: .aNewFile.txt should exist"
fi
rm $TEST_CONFIG_LF_HOME/lfrc
rm $TEST_CONFIG_LF_HOME/preview.sh
rm $TEST_CONFIG_LF_HOME/aNewFile.txt
rm $TEST_CONFIG_LF_HOME/.aNewFile.txt
rmdir $TEST_CONFIG_HOME/lf

# folder does not exist
diff_folder $DOTFILES_CONFIG_HOME/lf $TEST_CONFIG_HOME/lf
if [ -d $TEST_CONFIG_HOME/lf ]; then
  echo "Assert: folder should not exist"
fi


################################
# create_folder
#
# folder already exist
if [ ! -d $TEST_CONFIG_BOOKMARKS_HOME ]; then
  mkdir $TEST_CONFIG_BOOKMARKS_HOME
fi
create_folder $TEST_CONFIG_BOOKMARKS_HOME
if [ ! -d $TEST_CONFIG_BOOKMARKS_HOME ]; then
  echo "Assert: folder should exist. foldername = "
fi

# folder created
if [ -d $TEST_CONFIG_BOOKMARKS_HOME ]; then
  rmdir $TEST_CONFIG_BOOKMARKS_HOME
fi
create_folder $TEST_CONFIG_BOOKMARKS_HOME
if [ ! -d $TEST_CONFIG_BOOKMARKS_HOME ]; then
  echo "Assert: folder should exist. foldername = "
fi


################################
# restore_dotfile
#
# file already exist
create_folder $TEST_CONFIG_BOOKMARKS_HOME
touch $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
restore_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
if [ ! -f $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks ]; then
  echo "Assert: file should exist. filename = $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks"
fi
rm $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
rmdir $TEST_CONFIG_BOOKMARKS_HOME 


# file restored
create_folder $TEST_CONFIG_BOOKMARKS_HOME
restore_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
if [ ! -f $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks ]; then
  echo "Assert: file should exist. filename = $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks"
fi
rm $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
rmdir $TEST_CONFIG_BOOKMARKS_HOME 


################################
# backup_dotfile
#
# file does not exist
backup_dotfile $DOTFILES_BOOKMARKS_HOME/Bookmarks $TEST_CONFIG_BOOKMARKS_HOME/Bookmarks
