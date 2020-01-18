#
# ~/.bash_profile
#

# My BASH Profile
# by lucassimoes

# Loaded as soon as logged into tty or logged through SSH
# ( as soon as `login'  execs `bash')

# If you want to change something, you know precisely what file to edit to make it happen --
# aliases and transient shell options go in .bashrc, and environment variables, process limits,
# and so on go in .bash_profile. (http://mywiki.wooledge.org/DotFiles)

# Source BASHRC  (unnecessary since it is souced as we begin a Terminal Emulator)
# [[ -f ~/.bashrc ]] && source ~/.bashrc

# As user logs into tty1, exec Graphical Session
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec gnome-session --session=gnome-wayland
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit
# [[ -z $DISPLAY && $XDG_VTNR -eq 2 ]] && exec xinit gnome
