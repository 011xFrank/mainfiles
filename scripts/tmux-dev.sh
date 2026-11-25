#!/usr/bin/env bash

name="${1:-main}"
projects="$HOME/projects/"

create_session(){
      tmux new-session -d -s "$name" -c "$dir" -n editor 'nvim .'
      tmux new-window  -t "$name": -c "$dir" -n shell
      tmux select-window -t "$name":editor
}

if ! tmux has-session -t "=$name" 2>/dev/null; then
  case "$name" in
    rust)
      dir="$projects/rust"
      create_session
      ;;
    c)
      dir="$projects/c"
      create_session
      ;;
    python)
      dir="$projects/python"
      create_session
      ;;
    nvim)
      dir="$HOME/.config/nvim"
      create_session
      ;;
    *)
      create_session
      ;;
  esac
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "=$name"
else
  tmux attach -t "=$name"
fi
