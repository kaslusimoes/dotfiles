#
# ~/.zprofile
#

# My ZSH Profile
# by kaslusimoes

# As user logs into tty1, exec Graphical Session
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec gnome-session --session=gnome-wayland
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit i3
# [[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec xinit gnome
