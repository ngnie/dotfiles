#!/bin/zsh

# session name
session="trading"

# make session
tmux new-session -d -s $session

# make dotfiles window
tmux rename-window -t $session:1 'trading'
tmux send-keys -t $session:1 'cd $TRADING_HOME/resources/saxobank' C-m
tmux send-keys -t $session:1 'nvim account.txt' C-m 

# make notes window
tmux new-window -t $session:2 -n 'notes'
tmux send-keys -t $session:2 'cd $NOTES_HOME' C-m
tmux send-keys -t $session:2 'nvim notes-trading.txt' C-m

tmux selectw -t $session:1
