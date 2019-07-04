#!/bin/sh

tmux new-session -d

tmux selectp -t 0
tmux splitw -h -p 50
tmux new-window
tmux splitw -h -p 50
tmux selectp -t 1
tmux splitw -v -p 50

tmux attach
