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

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias neoconf='~/.config/nvim/'
alias cprog='~/Desktop/C/'
alias mainfiles'~/mainfiles/'

alias q="exit"
alias tm="tmux"
alias cat="batcat"
alias c="clear"
alias nv='nvim'
alias battery='./battery.sh'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='rm -v'
alias music='./.music.py'
alias install='sudo apt install'

alias gh='history|grep'
alias update='sudo apt-get update -y && sudo apt-get upgrade -y'
alias r='source ~/.zshrc'

# alias ls='ls -l --human-readable --size -1 -S --color=auto'
# alias la='ls -aF'
# alias l.='ls -d .*'

alias eza='eza --icons=always --group-directories-first -lh'
alias ls='eza -1'
alias l.='eza -d .*'
alias la='eza -a'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
