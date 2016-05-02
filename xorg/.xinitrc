#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

session=${1:-gnome}
case $session in
    gnome          ) exec gnome-session;;
    gclassic       ) export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME 
                     export GNOME_SHELL_SESSION_MODE=classic
                     exec gnome-session --session=gnome-classic;;
    i3|i3-wm       ) exec i3 -V >> ~/.cache/i3log-$(date +'%F-%k-%M-%S') 2>&1;;
    i3-with-shmlog ) exec i3-with-shmlog;;
    i3gnome        ) exec i3-gnome;;
	*) exec $1;;
esac
