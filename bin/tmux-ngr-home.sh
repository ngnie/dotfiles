#!/bin/zsh

# session name
session="ngr-home"

# make session
tmux new-session -d -s $session

# make dotfiles window
tmux rename-window -t $session:1 'dotfiles'
tmux send-keys -t $session:1 'cd $DOTFILES_HOME' C-m
tmux send-keys -t $session:1 'nvim' C-m 

# make notes window
tmux new-window -t $session:2 -n 'notes'
tmux send-keys -t $session:2 '$NOTES_HOME' C-m

# make notes windows
tmux new-window -t $session:3 -n 'todo'
tmux send-keys -t $session:3 'cd $NOTES_HOME' C-m
