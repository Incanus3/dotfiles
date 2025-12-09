#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s extglob
shopt -s globstar

source ~/.bash_aliases

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

eval "$(fzf --bash)"
eval "$(starship init bash)"

source /usr/share/nvm/init-nvm.sh

export EDITOR=vim

export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/profile.d/grc.sh

export ASDF_DATA_DIR="/your/custom/data/dir"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:~/.local/bin:$PATH"

. <(asdf completion bash)

export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS=yes
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
