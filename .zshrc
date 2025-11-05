# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

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

alias restart-nginx='./nginx.restart.sh'

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
alias sn='sudo -E nvim'

alias eza='eza --icons=always --group-directories-first -lh'
alias ls='eza'
alias l.='eza -d .*'
alias la='eza -a'

alias status='systemctl status'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias rnginx='./restart_nginx.sh'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# 1. Define colors (optional, but makes it much clearer)
# ANSI Color Codes
export ZSH_BLUE="%{$fg[blue]%}"
export ZSH_GREEN="%{$fg[green]%}"
export ZSH_RED="%{$fg[red]%}"
export ZSH_YELLOW="%{$fg[yellow]%}"
export ZSH_NO_COLOR="%{$reset_color%}"

# 2. Configure Git status info (Crucial for any modern prompt)
# Load Zsh's built-in Git functions
autoload -Uz vcs_info
precmd_functions+=(vcs_info)
setopt prompt_subst

# Configure vcs_info to get the branch name/status
zstyle ':vcs_info:*' formats ' on (%b%u%c)'
zstyle ':vcs_info:*' actionformats ' on (%b|%a%u%c)'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '±' # +/- sign for unstaged changes
zstyle ':vcs_info:*' stagedstr '!' # ! sign for staged changes
# The final Git string will be $vcs_info_msg_0_

# 3. Set the PROMPT variable
# Components:
# ${ZSH_GREEN}%n       -> Username
# @${ZSH_BLUE}%m       -> @Hostname
# ${ZSH_NO_COLOR}      -> Reset color
# %~                   -> Current directory (truncated)
# ${ZSH_YELLOW}%(1)..$vcs_info_msg_0_... -> Git status (only shows if in a git repo)
# ${ZSH_GREEN}$       -> The prompt marker
PROMPT='${ZSH_GREEN}%n@%m${ZSH_NO_COLOR}:%~${ZSH_YELLOW}${(#b)vcs_info_msg_0_}${ZSH_NO_COLOR} ${ZSH_GREEN}$ ${ZSH_NO_COLOR}'
