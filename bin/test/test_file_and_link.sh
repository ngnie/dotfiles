#!/bin/sh

BAR_FILE=bar.txt

if [ -L $BAR_FILE ]; then
  echo "$BAR_FILE is a link"
else
  if [ -f $BAR_FILE ]; then
    echo "$BAR_FILE is a file"
  else
    echo "$BAR_FILE does not exist"
  fi
fi
