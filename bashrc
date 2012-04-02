export pi=$(echo "scale=10; 4*a(1)" | bc -l)
#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE="ibus"
#export QT_IM_MODULE="ibus"
export PYTHONDOCS="/usr/share/doc/python/html/"
export PYTHON2DOCS="/usr/share/doc/python2/html/"
export EDITOR=emacs
HISTFILESIZE=99999
HISTCONTROL=ignoredups
#PROMPT_COMMAND='date +%I:%M:%S'
shopt -s histappend
shopt -s checkwinsize
complete -cf sudo
complete -cf man
# Check for an interactive session
[ -z "$PS1" ] && return
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
	       
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1   ;;
      *.tar.gz)    tar xvzf $1   ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xvjf $1   ;;
      *.tgz)       tar xvzf $1   ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo " '$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file" 
  fi
}
doingwork() {
cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"
}
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}
define ()
{
lynx -dump "http://www.google.com/search?hl=en&q=define%3A+${1}&btnG=Google+Search" | grep -m 3 -w "*"  | sed 's/;/ -/g' | cut -d- -f1 > /tmp/templookup.txt
if [[ -s  /tmp/templookup.txt ]] ;then
until ! read response
do
echo "${response}"
done < /tmp/templookup.txt
else
echo "Sorry $USER, I can't find the term \"${1} \""
fi
\rm -f /tmp/templookup.txt
}
calc(){ 
    echo "$*" | bc -l;
}

#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;37m\]\!\[\e[m\]\[\e[0;32m\][\u@\H]\[\e[m\]\[\e[0;31m\]\D{%I:%M:%S}\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\n\[\e[0;32m\]>\[\e[m\]'
fortune
echo -e '\e[0;23m'
date +"EPOCH:%s LOCAL:%a %d.%m.%Y %I:%M:%S%p %z"
echo -e '\e[m'
#echo "Wenn mann gegen mann, die machine gewinnen"
