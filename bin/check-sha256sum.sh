#!/bin/zsh
#
checksum=$1
fileToCheck=$2

echo "$checksum *$fileToCheck" | shasum -a 256 --check 
