#!/usr/bin/env bash

tmux attach

if [ $? -eq 1 ]; then
  tmux
else
  tmux attach
fi

