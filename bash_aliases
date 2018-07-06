if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -F --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias diff='diff --color=auto'
fi

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias g='git'
alias man="LANG='en_US.UTF-8' man"
alias rdc='rdesktop -k en -g 1800x1000'
alias tree='tree -I "*~"'
alias pwgen='pwgen -ny 15 1'
alias mplayer-fb='mplayer2 -vo fbdev -fs -xy 1600 -zoom'
alias mutt-gmail='mutt -f imaps://jakubkalab@gmail.com@imap.gmail.com:993'

alias ssh-testing='ssh alto@alto-testing.mine.nu'
alias ssh-apps='ssh alto@alto-apps.mine.nu'
alias ssh-production='ssh alto@alto-production.mine.nu'
alias ssh-production-old='ssh alto@alto.mine.nu'
alias ssh-makro='ssh alto@rezervace.makro.cz'
alias ssh-azu="ssh alto@alto.mine.nu"
alias ssh-parlament="ssh ex.cichas@parlament"

alias objednavky='cd ~/Projects/alto/ruby/objednavky'
alias rezervace='cd ~/Projects/alto/ruby/rezervace'
alias eet-client='cd ~/Projects/alto/ruby/eet-client'
alias sk-client='cd ~/Projects/alto/ruby/sk-client'
alias mongo-sk-client='cd ~/Projects/alto/ruby/mongo-sk-client'

alias globus-bonus='cd ~/Projects/alto/js/globus-bonus-frontend'
alias mala-kasa='cd ~/Projects/alto/js/mala-kasa'
alias canteen='cd ~/Projects/alto/js/canteen'
alias kredit='cd ~/Projects/alto/js/kredit'
alias bakare='cd ~/Projects/alto/js/bakare'
alias orm='cd ~/Projects/alto/js/alto-orm'

alias eet='pyenv activate django3.6 && cd ~/Projects/alto/python/django/eet'
alias danube='pyenv activate django3.6 && cd ~/Projects/alto/python/django/datastore_danube'
alias datastore-bakare='pyenv activate django3.6 && cd ~/Projects/alto/python/django/datastore-bakare'
alias datastore-kredit='pyenv activate django3.6 && cd ~/Projects/alto/python/django/datastore-kredit'
alias datastore-canteen='pyenv activate django3.6 && cd ~/Projects/alto/python/django/datastore-canteen'
alias datastore-rezervace='pyenv activate django3.6 && cd ~/Projects/alto/python/django/datastore-rezervace'
alias foodie-api='pyenv activate kasa3.6 && cd ~/Projects/alto/python/kasa/foodie-api'

alias datastore-food='pyenv activate tornado3.6 && cd ~/Projects/alto/python/tornado/datastore-food'
alias datastore-rezervace-old='pyenv activate tornado3.6 && cd ~/Projects/alto/python/tornado/datastore-rezervace'
alias datastore-common='pyenv activate tornado3.6 && cd ~/Projects/alto/python/tornado/datastore-common/datastore_common'
alias tornado-utils='pyenv activate tornado3.6 && cd ~/Projects/alto/python/tornado/alto-tornado-utils/alto_tornado_utils'
alias globus-bonus-backend='pyenv activate tornado3.6 && cd ~/Projects/alto/python/tornado/globus-bonus-backend'
