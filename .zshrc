# --- Powerlevel10k instant prompt (keep at the very top) ---------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --- Environment -------------------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# --- History -----------------------------------------------------------------
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# --- fzf ---------------------------------------------------------------------
export FZF_DEFAULT_OPTS='
--color=gutter:#080607,bg+:#080607
--bind "ctrl-space:accept"
'

if command -v fzf >/dev/null 2>&1 && fzf --zsh >/dev/null 2>&1; then
  source <(fzf --zsh)
elif [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# --- Aliases -----------------------------------------------------------------
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
  alias cat='batcat'
fi

alias q='exit'
alias r='source ~/.zshrc'
alias tm='tmux'
alias n='nvim'
alias sn='sudoedit'
alias cht='tldr'

# file ops
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='trash -v'

alias vu='pactl set-sink-volume @DEFAULT_SINK@ +10% && killall -SIGUSR1 i3status'

# run builds
alias run='./run'
alias cr='cargo run'
alias cb='cargo build'

alias dev='bash $HOME/scripts/tmux-dev.sh'

# --- Functions ---------------------------------------------------------------
fs() {
  local s
  s=$(tmux list-sessions -F '#{session_name}' 2>/dev/null \
      | fzf --reverse --prompt='session> ') || return
  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$s"
  else
    tmux attach -t "$s"
  fi
}

list-font() {
  fc-list : family | sort -u | grep -i "$1"
}

# fuzzy-find a file in the current tree and open it in nvim
fn() {
  local selected_file
  selected_file=$(fzf --select-1)
  [ -n "$selected_file" ] && n "$selected_file"
}

fcd() {
  local selected_directory
  selected_directory=$(
    find ~/ \
      \( -name .git -o -name node_modules -o -name .cache -o -name vendor -o -name target \) -prune \
      -o -type d -print 2>/dev/null | fzf --select-1
  )
  [ -n "$selected_directory" ] && cd "$selected_directory"
}

# --- Powerlevel10k config ----------------------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
