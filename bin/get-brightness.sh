#!/bin/bash

brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)
percent=$(echo "$brightness*100"|bc|cut -f1 -d '.')
echo $percent
