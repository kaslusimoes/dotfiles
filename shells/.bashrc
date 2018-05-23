#
# ~/.bashrc
#

# My BASHRC
# by kaslusimoes

# Loaded as soon a Terminal Emulator is run
# (that is, when on a Interactive Shell, not a Login Shell)

# If you want to change something, you know precisely what file to edit to make it happen --
# aliases and transient shell options go in .bashrc, and environment variables, process limits,
# and so on go in .bash_profile. (http://mywiki.wooledge.org/DotFiles)

# If not running interactively, don't do anything
# [[ $- != *i* ]] && return

# If a compositor is enabled xterm will be transparent
# [ -n "$XTERM_VERSION" ] && transset-df -a -m 0.8 >/dev/null

# Separate files for defining ALIAS & FUNCTIONS
[[ -f ~/.config/shell/aliases.sh ]] && source ~/.config/shell/aliases.sh
[[ -f ~/.config/shell/functions.sh ]] && source ~/.config/shell/functions.sh
[[ -f ~/.config/shell/exports.sh ]] && source ~/.config/shell/exports.sh

[[ -f /usr/share/git/completion/git-completion.bash ]] && source /usr/share/git/completion/git-completion.bash

# AUR - z : https://github.com/rupa/z/ - jump around
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Don't know if it should come here. At least colors tree output
eval $(dircolors -b)
