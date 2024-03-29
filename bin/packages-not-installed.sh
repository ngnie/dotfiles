#!/bin/sh

installed=$(pacman -Q | cut -d ' ' -f 1 | tr '\n' '|')
pacman -Ssq | egrep -v \'${installed}\' | fzf
