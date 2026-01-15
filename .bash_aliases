alias ls='eza -F'
alias cat=bat
alias ps='grc ps'
alias netstat='grc netstat'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lc='colorls --sd'

# alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias more=less

alias g='git'
alias lg='lazygit'
source /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias y='yarn'

alias man="LANG='en_US.UTF-8' man"
alias md='mdcat'
alias pwgen='pwgen -ny 15 1'
alias qwazar='zellij --layout qwazar'
