# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ ! -z "$TMUX" ]; then
	export PATH_UPDATED="false"
fi

# Add RVM to PATH for scripting
if [ "$PATH_UPDATED" != "true" ]; then
  export PATH="$HOME/.rvm/bin:$HOME/.pyenv/bin:$PATH:$HOME/.local/bin:$HOME/bin:$PATH"
  export PATH_UPDATED="true"

  # export PATH="~/.npm-global/bin:$PATH"
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

PROMPT_DIRTRIM=3

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

source ~/.git-prompt.sh

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\] $(~/.rvm/bin/rvm-prompt v g)\[\033[01;36m\]$(__git_ps1 " (%s)")\[\033[01;32m\] > \[\033[00m\]'
    # PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;32m\] > \[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LESS="-R"
export RI="-f ansi -w 160"
export XDG_CONFIG_HOME="$HOME/.config"
export TERM=xterm-256color

shopt -s extglob
shopt -s globstar
# may break completion
# shopt -s nullglob

# bash history size
export HISTFILESIZE=10000

export rvmsudo_secure_path=0
export rvm_autoupdate_flag=2

export WORKON_HOME=~/.python-envs
export VIRTUALENV_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# disable control flow - interferes with vim command-t
stty start undef stop undef

export JAVA_OPTS="-Xms512m -Xmx2048m -XX:PermSize=1024m -XX:MaxPermSize=1024m -XX:-UseGCOverheadLimit"

export NVM_DIR="/home/jakub/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/home/jakub/.npm-global/lib/node_modules

source ~/.tmuxinator.bash

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export EDITOR=vim

function ssh () { /usr/bin/ssh -t "$@" "tmux attach || tmux new"; }

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export POWERLINE_CONFIG_COMMAND="/home/jakub/.local/bin/powerline-config"

if [ -f ~/.local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
	source ~/.local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

base16_atelier-seaside
