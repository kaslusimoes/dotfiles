#!/bin/env sh

man() {
env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

getlanip(){
 echo $(ifconfig | grep broadcast | awk 'match($0,/inet/) {print substr($0,RSTAT+14,13)}')
}

setperms(){
 echo "Marcando todos os arquivos:   644.."
 find /home/lucas/{Programming,Dropbox,Pessoal} -type f -exec chmod 644 {} \;
 echo "Marcando todos os diretórios: 755.."
 find /home/lucas/{Programming,Dropbox,Pessoal} -type d -exec chmod 755 {} \;
}

updategit(){
 pushd ~/Programming/SomePackages
 for i in $(find ~/Programming/SomePackages -maxdepth 1 -type d | cut -d/ -f 6); do
    cd $i
    if [ -d ./.git ]; then
        echo ""
        echo "$i GIT FOLDER:"
        git pull
    fi
    cd ..
 done
 popd
}

# zsh compatibility
if [[ $SHELL = '/bin/bash' ]]; then
    export -f man getlanip setperms updategit
fi
