#!/usr/bin/env bash
# ts <rust|nvim|main>: jump to a session, creating it on first use
name="${1:-main}"

if ! tmux has-session -t "=$name" 2>/dev/null; then
  case "$name" in
    rust)
      dir="$HOME/projects/rust"   # point this at your Rust workspace
      tmux new-session -d -s rust -c "$dir" -n editor 'nvim .'
      tmux new-window  -t rust: -c "$dir" -n shell
      tmux select-window -t rust:editor
      ;;
    nvim)
      dir="$HOME/.config/nvim"
      tmux new-session -d -s nvim -c "$dir" -n config 'nvim .'
      tmux new-window  -t nvim: -c "$dir" -n shell
      tmux select-window -t nvim:config
      ;;
    *)
      tmux new-session -d -s "$name" -c "$HOME"
      ;;
  esac
fi

if [ -n "$TMUX" ]; then
  tmux switch-client -t "=$name"
else
  tmux attach -t "=$name"
fi
