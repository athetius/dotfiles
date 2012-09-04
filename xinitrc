#!/bin/bash
(mpd) &
(xbindkeys)&
(setxkbmap -option compose:ralt) &
#(emacs --daemon) &
(sleep 1 && xcompmgr -c -C) &
(sleep 3 && dropbox) &
(xrdb -merge $HOME/.Xresources) &
#(sleep 1 && ibus-daemon -d --xim) &
#(sleep 5 && mplayer -quiet $HOME/.themes/dothack/login.ogg) &
if [[ $1 == "dwm" ]]
then
	echo "Starting dwm..."
	(while true; do
		MPD=$(mpc | head -1)
		BAT=$(acpi | awk '{print $4}' | sed s/","//g)
		CLK=$( date +'%a %d %b %I.%M')
		VOL=$( amixer get Master | tail -1 | awk '{ print $4}' | tr -d '[]' )
		xsetroot -name "Vol: $VOL | $MPD | Bat: $BAT | $CLK"
		sleep 10
	done) &
	(sleep 1 && nitrogen --restore) &
	exec $HOME/bin/dwm
else
	echo "Starting Awesome..."
	exec awesome
fi
