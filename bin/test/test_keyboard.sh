#!/bin/sh

printf "%s " "Press enter to continue"
read answer

if [ $answer = "Y" ]; then
  echo "Answer was Y"
else
  echo "Answer was No"
fi
