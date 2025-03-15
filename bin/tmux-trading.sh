#!/bin/zsh

# session name
session="trading"

# make session
tmux new-session -d -s $session

# make dotfiles window
tmux rename-window -t $session:1 'trading'
tmux send-keys -t $session:1 'cd $TRADING_HOME/saxobank' C-m
tmux send-keys -t $session:1 'nvim account.txt' C-m 

# make notes window
tmux new-window -t $session:2 -n 'notes'
tmux send-keys -t $session:2 'cd $NOTES_HOME' C-m
tmux send-keys -t $session:2 'nvim notes-trading.txt' C-m

# make log window
tmux new-window -t $session:3 -n 'log'
tmux send-keys -t $session:3 'cd $NOTES_HOME' C-m
tmux send-keys -t $session:3 'nvim notes-trading-log.txt' C-m

# make lf window
tmux new-window -t $session:4 -n 'files'
tmux split-window -t $session:4 -v
tmux send-keys -t $session:4.0 'cd $TRADING_HOME/trades' C-m
tmux send-keys -t $session:4.0 'lf' C-m
tmux send-keys -t $session:4.1 'cd $TRADING_HOME/learning/daytrade' C-m
tmux send-keys -t $session:4.1 'lf' C-m

tmux selectw -t $session:1
