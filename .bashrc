#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s extglob
shopt -s globstar

export EDITOR=vim

export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS=yes

export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

. ~/.bash_aliases

export _ZO_ECHO=1

eval "$(starship init bash)"
eval "$(fzf --bash)"

export PATH="$PATH:~/.local/bin"

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(mise activate bash)"
eval "$(zoxide init --cmd cd bash)"
