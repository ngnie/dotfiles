#!/bin/sh

CURRENT_FOLDER=.
TTF_HOME=/usr/share/fonts/TTF
TMP_HOME=/var/tmp

if [ ! -d $TTF_HOME ]; then
  mkdir -p $TTF_HOME
  if [ ! -d $TTF_HOME ]; then
    echo "Failed to create font folder. foldername = $TTF_FOLDER"
    exit -1
  fi
fi

if [ ! -d $TMP_HOME ]; then
  mkdir $TMP_HOME
  if [ ! -d $TMP_HOME ]; then
    echo "Failed to create tmp folder. foldername = $TMP_FOLDER"
    exit -1
  fi
fi

cd $TMP_HOME
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mv *.ttf $TTF_HOME
cd $CURRENT_FOLDER

echo "Fonts moved into $TTF_HOME"
