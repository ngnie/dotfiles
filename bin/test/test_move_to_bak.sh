#!/bin/sh

FILE=foo.txt

if [ -f $FILE ]; then
  mv $FILE $FILE.bak
  if [ -f $FILE.bak ]; then
    echo "Bak file created: $FILE.bak"
  fi
fi
