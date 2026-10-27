#!/usr/bin/env bash

# Esc in normal mode quits; Esc in insert mode switches to normal mode
if [[ $FZF_PROMPT == "[N] > " ]]; then
  echo abort
else
  echo "disable-search+change-prompt([N] > )+rebind(j,k,g,G,i,q,/,ctrl-d,ctrl-u)"
fi
