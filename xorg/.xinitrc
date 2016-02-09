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
    xfce|xfce4  ) exec startxfce4;;
    #pantheon    ) exec pantheon-session;;
    mate        ) exec mate-session;;
    openbox     ) exec openbox-session;;
    gnome       ) exec gnome-session;;
    i3|i3-wm    ) exec i3 -V >> ~/.cache/i3log-$(date +'%F-%k-%M-%S') 2>&1;;
    awesome     ) exec awesome;;
    subtle      ) exec subtle;;
    enlight     ) exec enlightenment_start;;
    budgie      ) exec budgie-session;;
    kde|plasma  ) exec startkde;;
    twm         ) exec twm;;
	*) exec $1;;
esac
