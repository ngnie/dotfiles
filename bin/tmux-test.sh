#!/bin/zsh

# session name
session="trading"

# make session
tmux new-session -d -s $session

tmux rename-window -t $session:1 'trading'
tmux split-window -t $session:1 -v

tmux send-keys -t $session:1.0 'cd $TRADING_HOME/trades' C-m
tmux send-keys -t $session:1.0 'lf' C-m

tmux send-keys -t $session:1.1 'cd $TRADING_HOME/learning/daytrade' C-m
tmux send-keys -t $session:1.1 'lf' C-m

tmux select-pane -t $session:1.0
