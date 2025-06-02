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
alias t="tmux"
alias cat="batcat"
alias c="clear"
alias g="git"
alias lg="lazygit"

alias n='nvim'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='trash -v'

alias f='fzf'
alias fn='n $(fzf)'
alias fd='cd $(find . -type d | fzf)'
alias fh='history | fzf'

alias music='./.music.py'
alias install='sudo apt install'
alias uninstall='sudo apt purge'
alias update='sudo apt-get update -y; sudo apt full-upgrade -y'
alias r='source ~/.zshrc'
alias netdiscover='sudo netdiscover'
alias cht='tldr'
alias clone='git clone'

alias eza='eza --icons=always --group-directories-first -lh'
alias ls='eza'
alias l.='eza -d .*'
alias la='eza -a'

export FZF_DEFAULT_OPTS=""


source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# if [ -z "$TMUX" ]; then
  # tmux attach -t default || tmux new -s default
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
