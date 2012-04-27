alias suvim="sudo vim"
alias musicvlc="nvlc --browse-dir $HOME/Music"
alias music="ncmpcpp"
alias ..='cd ..'
alias ...=".. && .."
alias ....="... && .."
alias ~="cd $HOME"
alias ls='ls --color=auto'
alias dir='ls --color=auto -Alh'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias agrep='egrep --color=auto'
alias cal='cal -m'
alias epoch='date +"EPOCH: %s"'
alias daysleft='echo "There are $(($(date -d"De 31, $(date +%Y)")-$date +%j))) left in year $(date +%Y)."'
alias beep='beep -f 5000 -l 50 -r 2'
alias todo="todo.sh"
alias mail="mutt"
alias go="gnugo"
alias halt="sudo halt"
alias irc="irssi"
alias pacman="sudo pacman-color"
alias update="pacman -Syu"
alias youtube-music="youtube-dl -t --extract-audio --audio-format vorbis"