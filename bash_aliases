alias suvim="sudo vim"
alias music="ncmpcpp"
alias ...=".. ; .."
alias ....=".. ; .. ; .."
alias ~="cd $HOME"
alias ls='ls --color=auto'
alias dir='ls --color=auto -Alh'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias agrep='egrep --color=auto'
alias cal='cal -m'
alias epoch='date +"EPOCH: %s"'
alias daysleft='echo "There are $(($(date -d"Dec 31, $(date +%Y)" +%j)-$(date +%j))) days left in year $(date +%Y)."'
alias go="gnugo"
alias halt="sudo halt"
alias reboot="sudo reboot"
alias update="sudo emerge --sync"
alias upgrade="sudo emerge --update --ask --deep --newuse --verbose --with-bdeps=y world"
alias irc="irssi"
alias xdosbox="startx /usr/games/bin/dosbox :1"
alias mplayercaca="mplayer2 -vo caca"
alias imageview="sxiv -r"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias news="newsbeuter"
alias podcast="podbeuter"
