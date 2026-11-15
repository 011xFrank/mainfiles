# --- Powerlevel10k instant prompt (keep at the very top) ---------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Oh My Zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh-autosuggestions and zsh-syntax-highlighting must be cloned into
# ~/.oh-my-zsh/custom/plugins/ . Keep syntax-highlighting LAST.
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

# Load fzf keybindings/completion once. `fzf --zsh` needs fzf >= 0.48;
# otherwise fall back to the file the fzf installer generates.
if command -v fzf >/dev/null 2>&1 && fzf --zsh >/dev/null 2>&1; then
  source <(fzf --zsh)
elif [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# --- Aliases -----------------------------------------------------------------
# bat is installed as "batcat" on Debian/Ubuntu
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
  alias cat='batcat'
fi

alias q='exit'
alias c='clear'
alias r='source ~/.zshrc'
alias tm='tmux'
alias n='nvim'
alias sn='sudoedit'
alias s='sudo'
alias cht='tldr'

# git
alias g='git'
alias gl='git log --oneline --decorate --graph --all'
alias gs='git status -s'
alias lg='lazygit'
alias clone='git clone'

# file ops
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='trash -v'   # note: this is NOT a real rm; be careful on other machines

# apt
alias install='sudo apt install'
alias uninstall='sudo apt remove'
alias purge='sudo apt purge'
alias update='sudo apt-get update && sudo apt full-upgrade'

# systemd
alias status='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'

# misc tools (absolute paths so they work from any directory)
alias rnginx='~/restart_nginx.sh'
alias burp='~/BurpSuite/BurpSuite &'
alias telegram='~/Downloads/td-setup-linux-x64-7.2.9/Telegram/Telegram &'
alias vu='pactl set-sink-volume @DEFAULT_SINK@ +10% && killall -SIGUSR1 i3status'
alias run='./run'

# rust
alias rr='cargo run'
alias rb='cargo build'

# --- Functions ---------------------------------------------------------------
list-font() {
  fc-list : family | sort -u | grep -i "$1"
}

# fuzzy-find a file in the current tree and open it in nvim
fn() {
  local selected_file
  selected_file=$(fzf --select-1)
  [ -n "$selected_file" ] && n "$selected_file"
}

# fuzzy-find a directory under $HOME and cd into it
# (named fcd so it doesn't shadow the real `fd`)
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
# Run `p10k configure` or edit ~/.p10k.zsh to customize the prompt.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
