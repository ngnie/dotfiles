#!/bin/sh

FOO_FILE=foo.txt

if [ -f $FOO_FILE ]; then
  echo "File $FOO_FILE exists"
else
  echo "foo does not exists"
fi
