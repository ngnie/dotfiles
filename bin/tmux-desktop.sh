#!/bin/zsh

# session name
session="desktop"

# make session
tmux new-session -d -s $session

# make desktop window
tmux rename-window -t $session:1 'desktop'
tmux send-keys -t $session:1 'cd $DESKTOP_HOME' C-m
tmux send-keys -t $session:1 'lf' C-m

# make download window
tmux new-window -t $session:2 -n 'download'
tmux send-keys -t $session:2 'cd $DOWNLOAD_HOME' C-m
tmux send-keys -t $session:2 'lf' C-m

tmux selectw -t $session:1
