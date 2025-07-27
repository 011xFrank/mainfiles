# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias q="exit"
alias tm="tmux"
alias cat="batcat"
alias c="clear"
alias g="git"
alias gl="git log --oneline --decorate --graph --all"
alias gs="git status -s"
alias lg="lazygit"
alias s='sudo'

alias n='nvim'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='trash -v'

fn() {
    local selected_file
    selected_file=$(fzf)
    if [ -n "$selected_file" ]; then
        n "$selected_file"
    fi
}


fd() {
    local selected_directory
    selected_directory=$(find ~/ -type d \( -path '*/.git' -prune \) -o -print 2>/dev/null | fzf)
    if [ -n "$selected_directory" ]; then
        cd "$selected_directory"
    fi
}

alias install='sudo apt install'
alias uninstall='sudo apt purge'
alias update='sudo apt-get update -y; sudo apt full-upgrade -y'
alias r='source ~/.zshrc'
alias cht='tldr'
alias clone='git clone'

alias eza='eza --icons=always --group-directories-first -lh'
alias ls='eza'
alias l.='eza -d .*'
alias la='eza -a'

source <(fzf --zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/home/doodah/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/doodah/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
