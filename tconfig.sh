#!/bin/sh

tmux new-session -d
tmux select-pane -t 0
tmux split-window -v -p 20
tmux split-window -h -p 50
tmux select-pane -t 0
tmux split-window -h -p 50
tmux attach
