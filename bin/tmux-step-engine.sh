#!/bin/zsh

# session name
session="step-engine"

# make session
tmux new-session -d -s $session

# make dotfiles window
tmux rename-window -t $session:1 'nvim'
tmux send-keys -t $session:1 'cd $REPOS_HOME/step-engine/' C-m
tmux send-keys -t $session:1 'nvim' C-m 

# make notes window
tmux new-window -t $session:2 -n 'cmd'
tmux send-keys -t $session:2 'cd $REPOS_HOME/step-engine/' C-m
tmux send-keys -t $session:2 clear C-m

tmux selectw -t $session:1
