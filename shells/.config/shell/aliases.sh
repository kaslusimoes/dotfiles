#!/bin/env sh

# Simple Bash Modified Utilities
alias pacman='pacman --color=auto'
alias ls='ls -hF --color=auto'
alias grep='grep -i --color=auto'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -E -S --tabsize=4 -i -k -m -w'
alias ping='ping -c 3'
alias dmesg='dmesg -HL'
alias cp='cp -v'
alias ncmpcpp='ncmpcpp -c ~/.config/ncmpcpp/ncmpcpp.conf'
alias irssi='irssi --config ~/.config/irssi/irssi.conf'
alias fuck='$(thefuck $(fc -ln -1))'

# Typo Aliases
alias grpe='grep'

# Effective Aliases
alias ...='cd ../..'
alias lh='ls -d .*'
alias mpdplay='ncmpcpp play'
alias mpdpause='ncmpcpp pause'
alias mpdvol='ncmpcpp volume'
alias localiza='sudo updatedb && locate'
alias ijulia='ipython notebook --profile julia'
alias ju='clear;julia'
alias py='clear;python'
alias kkk='gala --replace &'
alias ggg='mutter --replace &'
alias mysystem='phoronix-test-suite detailed-system-info'
alias listdrive='lsblk -o NAME,SIZE,MOUNTPOINT,PARTUUID'
alias emc='emacsclient -nw'

# Internet  Aliases
alias pinga='ping www.google.com'
alias getmyip='wget http://ipecho.net/plain -O - -q ; echo'
alias checknet='iw dev wlp1s0 link'
alias spdtest='speedtest-cli --share'
alias connect='nmcli dev wifi connect MALG password 121639SCS'
alias fleming='ssh -D12345 kaslusimoes@fleming.cecm.usp.br'
alias proccm='ssh -D12345 kaslu@proccm.redealuno.usp.br'
alias youtubesong='youtube-dl --extract-audio --audio-format mp3'

# Dangerous Admin Alias
# alias lfsboot="sudo chroot /mnt/lfs /tools/bin/env -i HOME=/root TERM="$TERM" PS1='\u:\w\$ ' PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin /tools/bin/bash --login +h"
alias getoutx='sudo pkill -15 X'
