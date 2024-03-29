#!/bin/sh

validate() {
  if [ -f $1 ]; then
    diff $1 $2 > /dev/null 2>&1
    error=$?
    if [ $error -eq 0 ]; then
      echo "File is up to date: $1"
    elif [ $error -eq 1 ]; then
      echo "File has difference. Check it: $1"
    else
      echo "Diff call failed: $1"
    fi
  else
    echo "File does not exist: $1"
  fi
}

FILE1=foo.txt
FILE2=foo/foo.txt

validate $FILE1 $FILE2


