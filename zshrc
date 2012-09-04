unset PS1
export pi=$(echo "scale=10; 4*a(1)" | bc -l)
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export PYTHONDOCS="/usr/share/doc/python/html/"
export PYTHON2DOCS="/usr/share/doc/python2/html/"
export EDITOR="/usr/bin/vim"
export GIT_EDITOR="/usr/bin/vim"
unset RUBYOPT
if [[ -f ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi

extract() {
  if [[ -f $1 ]] ; then
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

calc(){ 
    echo "$*" | bc -l;
}
autoload -U compinit promptinit colors 
compinit
promptinit
colors
setopt auto_cd beep appendhistory correctall
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End


PATH=$PATH:$HOME/.rvm/bin:$HOME/bin # Add RVM to PATH for scripting
RPROMPT="%D{%a %d %b}"
PROMPT="%{$fg[white]%}%!%{$fg[yellow]%}[%n@%m]%{$fg[red]%}%D{%I:%M:%S} %{$fg_bold[blue]%}%~
%{$fg[yellow]%}>%{$reset_color%}"

fortune
echo -e '\e[0;23m'
date +"EPOCH:%s LOCAL:%a %d.%m.%Y %I:%M:%S%p %z"
echo -e '\e[m'
