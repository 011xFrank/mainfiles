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
