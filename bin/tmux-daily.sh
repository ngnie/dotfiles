#!/bin/zsh

./tmux-ngr.sh
./tmux-trading.sh
./tmux-desktop.sh

cd ~ && tmux attach
