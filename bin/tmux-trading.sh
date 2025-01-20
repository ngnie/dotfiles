#!/bin/zsh

# session name
session="trading"

# make session
tmux new-session -d -s $session

# make dotfiles window
tmux rename-window -t $session:1 'trading'
tmux send-keys -t $session:1 'cd $TRADING_HOME/resources/saxobank' C-m
tmux send-keys -t $session:1 'nvim account.txt' C-m 

tmux selectw -t $session:1
