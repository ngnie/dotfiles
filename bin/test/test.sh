#!/bin/sh

FOO_FILE=foo.txt
BAR_FILE=bar.txt

foo() {
  echo "foo called: $1"
}

if [ -f $FOO_FILE ]; then
  echo "File $FOO_FILE exists"
else
  echo "foo does not exists"
fi

if [ -L $BAR_FILE ]; then
  echo "$BAR_FILE is a link"
else
  if [ -f $BAR_FILE ]; then
    echo "$BAR_FILE is a file"
  else
    echo "$BAR_FILE does not exist"
  fi
fi

foo bar

#printf "%s " "Press enter to continue"
#read ans
