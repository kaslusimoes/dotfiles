#
# ~/.zshrc
#

# My ZSHRC
# by lucassimoes

# Lines configured by zsh-newuser-install
HISTFILE=~/.histzsh
HISTSIZE=10000
SAVEHIST=50000

[[ -f ~/.config/shell/options.zsh ]] && source ~/.config/shell/options.zsh
[[ -f ~/.config/shell/keybinds.zsh ]] && source ~/.config/shell/keybinds.zsh

zstyle :compinstall filename '/home/lucas/.zshrc'

autoload -Uz compinit colors
compinit; colors

zstyle ':completion:*' menu select

BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Left prompt
PROMPT="%B%F{red}%~%f%b %(!.#.$) "

# Right prompt (black bold?)
RPROMPT="%B%F{magenta}%n@%m%f%b"

[[ -f ~/.config/shell/aliases.sh ]] && source ~/.config/shell/aliases.sh
[[ -f ~/.config/shell/functions.sh ]] && source ~/.config/shell/functions.sh
[[ -f ~/.config/shell/exports.sh ]] && source ~/.config/shell/exports.sh

# AUR - z : https://github.com/rupa/z/ - jump around
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
