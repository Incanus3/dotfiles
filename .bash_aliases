# if [ -x /usr/bin/dircolors ]; then
# 	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
# 	alias ls='ls -F --color=auto'
# 	alias grep='grep --color=auto'
# 	alias fgrep='fgrep --color=auto'
# 	alias egrep='egrep --color=auto'
# 	alias diff='diff --color=auto'
# fi

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
alias rdc='rdesktop -k en -g 1800x1000'
alias tree='tree -I "*~"'
alias mux='tmuxinator'
alias md='mdcat'
alias pwgen='pwgen -ny 15 1'
alias qwazar='zellij --layout qwazar'
alias mplayer-fb='mplayer2 -vo fbdev -fs -xy 1600 -zoom'
alias mutt-gmail='mutt -f imaps://jakubkalab@gmail.com@imap.gmail.com:993'
