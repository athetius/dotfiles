ulimit -c unlimited
export PATH=$PATH:/home/athetius/bin
export LOCALE="en:GB"
export LANG="en_GB.UTF-8"
#export LOCALE="de_DE.UTF-8"
#export LANG="de_DE.UTF-8"
export LC_TIME="de_DE.UTF-8"
export LC_COLLATE="C"
#export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007'"
. $HOME/.bashrc
